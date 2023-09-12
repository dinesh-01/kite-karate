import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.junit5.Karate;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunner {

    @Test
    public void testParallel() throws Exception {

        int retryCount = 0;

        Results results = Karate.run().relativeTo(getClass()).outputCucumberJson(true).outputJunitXml(true)
                .parallel(1);

        if (results.getFailCount() > 0) {
            for (int i = 0; i < retryCount; i++) {
                retryFailedTests(results);
            }
        }

        generateReport(results.getReportDir());
        // assertTrue(results.getErrorMessages(), results.getFailCount() == 0);

    }

    public static void generateReport(String karateOutputPath) throws Exception {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        final List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "FreshBots");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

    Results retryFailedTests(Results results) {
        System.out.println("======== Retrying failed tests ========");

        Results initialResults = results;
        List<ScenarioResult> retryResult = results.getScenarioResults().filter(ScenarioResult::isFailed)
                .parallel()
                .map(scenarioResult -> initialResults.getSuite().retryScenario(scenarioResult.getScenario()))
                .collect(Collectors.toList());
        for (ScenarioResult scenarioResult : retryResult) {
            results = results.getSuite().updateResults(scenarioResult);
        }
        return results;
    }

}
