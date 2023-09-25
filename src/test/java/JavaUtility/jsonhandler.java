package JavaUtility;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class jsonhandler {

    public static void duplicateEntry(String jsondata, String tradingsymbol ) {

        
        String filePath = jsondata; // Replace with the path to your JSON file
        String keyToCheck = tradingsymbol; // Replace with the key you want to check for duplicates

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(new File(filePath));

            if (checkForDuplicateEntries(jsonNode, keyToCheck)) {
                System.out.println("Duplicate entries found for key: " + keyToCheck);
            } else {
                System.out.println("No duplicate entries found for key: " + keyToCheck);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static boolean checkForDuplicateEntries(JsonNode jsonNode, String keyToCheck) {
        if (jsonNode.isArray()) {
            Set<String> uniqueValues = new HashSet<>();

            for (JsonNode arrayNode : jsonNode) {
                JsonNode keyValueNode = arrayNode.get(keyToCheck);

                if (keyValueNode != null) {
                    String keyValue = keyValueNode.asText();

                    if (!uniqueValues.add(keyValue)) {
                        return true; // Duplicate entry found
                    }
                }
            }
        }

        return false;
    }
}
