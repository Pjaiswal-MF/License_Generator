package files;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.stream.Collectors;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

public class Client
{
    private CloseableHttpClient httpClient = HttpClientBuilder.create().setUserAgent("NewUser").setMaxConnPerRoute(4).build();

    public String get(String url) throws IOException
    {

        HttpGet getRequest = new HttpGet(url);
        HttpResponse httpResponse = httpClient.execute(getRequest);

        if (httpResponse.getStatusLine().getStatusCode() != 200) {
            throw new RuntimeException("Failed : HTTP error code : " + httpResponse.getStatusLine().getStatusCode());
        }

        BufferedReader br = new BufferedReader(new InputStreamReader((httpResponse.getEntity().getContent())));

        return br.lines().collect(Collectors.joining());

    }

}
