package com.project.platform.renting.web.config;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.*;
import com.project.platform.renting.core.model.ProductAttribute;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class JacksonConfig { //config for Jackson library

    @Bean
    @Primary
    public ObjectMapper objectMapper(Jackson2ObjectMapperBuilder builder) {
        ObjectMapper objectMapper = builder.createXmlMapper(false).build();
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);//date serialization format
        return objectMapper;
    }

    // custom JSON serializer for ProductAttribute
    // serializes only ID field
   public static class ProductAttributeSerializer extends JsonSerializer<ProductAttribute> {

        @Override
        public void serialize(
                final ProductAttribute value, final JsonGenerator jgen, final SerializerProvider provider)
                throws IOException {
            jgen.writeFieldName(String.valueOf(value.getName()));
        }
    }

    // custom product attributes deserializer for Product entity
    // expected JSON: {{id:id,value:value}}
    public static class attributesDeserializer extends JsonDeserializer<Map<ProductAttribute, String>> {

        @Override
        public Map<ProductAttribute, String> deserialize(JsonParser jsonParser, DeserializationContext deserializationContext)
                throws IOException, NullPointerException {
            Map<ProductAttribute, String> productAttributes = new HashMap();
            JsonNode jsonNode = jsonParser.readValueAsTree();
            jsonNode.forEach((JsonNode node) -> {
                String attributeValue = node.get("value").asText();
                if(attributeValue != null && !attributeValue.isEmpty()) {
                    ProductAttribute attribute = new ProductAttribute();
                    attribute.setId(node.get("id").asInt());
                    productAttributes.put(attribute, attributeValue);
                }
            });
            return productAttributes;
        }
    }
}