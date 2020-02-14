package files;

import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JacksonParser
{
    private ObjectMapper objectMapper = new ObjectMapper();

    public int getStatus(byte[] jsonData) throws IOException
    {
        JsonNode rootnode = objectMapper.readTree(jsonData);
        JsonNode tempnode = rootnode.path("status");
        return tempnode.asInt();
    }

    public String getNestedStatus(byte[] jsonData) throws IOException
    {
        JsonNode rootnode = objectMapper.readTree(jsonData);
        JsonNode tempnode = rootnode.path("licenses");
        return tempnode.get(0).path("status").asText();
    }

    public String getNestedErrMsgAsso(byte[] jsonData) throws IOException
    {
        JsonNode rootnode = objectMapper.readTree(jsonData);
        JsonNode tempnode = rootnode.path("associations");
        return tempnode.get(0).path("errorMessage").asText();
    }

    public String getNestedErrMsgDisAsso(byte[] jsonData) throws IOException
    {
        JsonNode rootnode = objectMapper.readTree(jsonData);
        JsonNode tempnode = rootnode.path("disassociations");
        return tempnode.get(0).path("errorMessage").asText();
    }

    public String getErrMsg(byte[] jsonData) throws IOException
    {
        JsonNode rootnode = objectMapper.readTree(jsonData);

        // read JSON like DOM Parser
        JsonNode tempnode = rootnode.path("errorMessage");

        if(!tempnode.isNull()) {
            return tempnode.asText();
        }

        return null;
    }





}
