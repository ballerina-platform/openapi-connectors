// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    string authorization;
|};

# Number of diffusion steps to run
@constraint:Int {minValue: 10, maxValue: 150}
public type Steps int;

public type OrganizationMembership record {
    string id;
    boolean is_default;
    string name;
    string role;
};

# How much influence the `init_image` has on the diffusion process. Values close to `1` will yield images very similar to the `init_image` while values close to `0` will yield images wildly different than the `init_image`. The behavior of this is meant to mirror DreamStudio's "Image Strength" slider.  <br/> <br/> This parameter is just an alternate way to set `step_schedule_start`, which is done via the calculation `1 - image_strength`. For example, passing in an Image Strength of 35% (`0.35`) would result in a `step_schedule_start` of `0.65`.
@constraint:Float {maxValue: 1}
public type InitImageStrength float;

# Skips a proportion of the start of the diffusion steps, allowing the init_image to influence the final generated image.  Lower values will result in more influence from the init_image, while higher values will result in more influence from the diffusion steps.  (e.g. a value of `0` would simply return you the init_image, where a value of `1` would return you a completely different image.)
@constraint:Number {maxValue: 1}
public type StepScheduleStart decimal;

public type ImageToImageRequestBody record {
    string 'text_prompts\[0\]\[text\];
    float 'text_prompts\[0\]\[weight\];
    # Image used to initialize the diffusion process, in lieu of random noise.
    InitImage init_image;
    # Whether to use `image_strength` or `step_schedule_*` to control how much influence the `init_image` has on the result.
    InitImageMode init_image_mode?;
    # How much influence the `init_image` has on the diffusion process. Values close to `1` will yield images very similar to the `init_image` while values close to `0` will yield images wildly different than the `init_image`. The behavior of this is meant to mirror DreamStudio's "Image Strength" slider.  <br/> <br/> This parameter is just an alternate way to set `step_schedule_start`, which is done via the calculation `1 - image_strength`. For example, passing in an Image Strength of 35% (`0.35`) would result in a `step_schedule_start` of `0.65`.
    InitImageStrength image_strength?;
    # Skips a proportion of the start of the diffusion steps, allowing the init_image to influence the final generated image.  Lower values will result in more influence from the init_image, while higher values will result in more influence from the diffusion steps.  (e.g. a value of `0` would simply return you the init_image, where a value of `1` would return you a completely different image.)
    StepScheduleStart step_schedule_start?;
    # Skips a proportion of the end of the diffusion steps, allowing the init_image to influence the final generated image.  Lower values will result in more influence from the init_image, while higher values will result in more influence from the diffusion steps.
    StepScheduleEnd step_schedule_end?;
    # How strictly the diffusion process adheres to the prompt text (higher values keep your image closer to your prompt)
    CfgScale cfg_scale?;
    ClipGuidancePreset clip_guidance_preset?;
    # Which sampler to use for the diffusion process. If this value is omitted we'll automatically select an appropriate sampler for you.
    Sampler sampler?;
    # Number of images to generate
    Samples samples?;
    # Random noise seed (omit this option or use `0` for a random seed)
    Seed seed?;
    # Number of diffusion steps to run
    Steps steps?;
};

# Desired width of the output image.  Only one of `width` or `height` may be specified.
@constraint:Int {minValue: 512}
public type UpscaleImageWidth int;

public type ClipGuidancePreset string;

# Width of the image in pixels.  Must be in increments of 64 and pass the following validation:
# - For 768 engines: <span style='display: flex; justify-content: flex-start; gap:8px'>589,824 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
# - All other engines: <span style='display: flex; justify-content: flex-start; gap:8px'>262,144 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
@constraint:Int {minValue: 128}
public type DiffuseImageWidth int;

# How strictly the diffusion process adheres to the prompt text (higher values keep your image closer to your prompt)
@constraint:Number {maxValue: 35}
public type CfgScale decimal;

# Skips a proportion of the end of the diffusion steps, allowing the init_image to influence the final generated image.  Lower values will result in more influence from the init_image, while higher values will result in more influence from the diffusion steps.
@constraint:Number {maxValue: 1}
public type StepScheduleEnd decimal;

public type Image record {
    # Image encoded in base64
    string 'base64?;
    string finishReason?;
    # The seed associated with this image
    decimal seed?;
};

# Desired height of the output image.  Only one of `width` or `height` may be specified.
@constraint:Int {minValue: 512}
public type UpscaleImageHeight int;

# Optional grayscale mask that allows for influence over which pixels are eligible for diffusion and at what strength. Must be the same dimensions as the `init_image`. Use the `mask_source` option to specify whether the white or black pixels should be inpainted.
public type MaskImage record {byte[] fileContent; string fileName;};

# The result of the generation process.
# - `SUCCESS` indicates success
# - `ERROR` indicates an error
# - `CONTENT_FILTERED` indicates the result affected by the content filter and may be blurred.
# 
# This header is only present when the `Accept` is set to `image/png`.  Otherwise it is returned in the response body.
public type FinishReason string;

# An array of text prompts to use for generation.
# 
# Given a text prompt with the text `A lighthouse on a cliff` and a weight of `0.5`, it would be represented as:
# 
# <pre>
# "text_prompts": [
#   {
#     "text": "A lighthouse on a cliff",
#     "weight": 0.5
#   }
# ]
# </pre>
@constraint:Array {minLength: 1}
public type TextPromptsForTextToImage TextPrompt[];

# Whether to use `image_strength` or `step_schedule_*` to control how much influence the `init_image` has on the result.
public type InitImageMode string;

# Image used to initialize the diffusion process, in lieu of random noise.
public type InitImage record {byte[] fileContent; string fileName;};

# For any given pixel, the mask determines the strength of generation on a linear scale.  This parameter determines where to source the mask from:
# - `MASK_IMAGE_WHITE` will use the white pixels of the mask_image as the mask, where white pixels are completely replaced and black pixels are unchanged
# - `MASK_IMAGE_BLACK` will use the black pixels of the mask_image as the mask, where black pixels are completely replaced and white pixels are unchanged
# - `INIT_IMAGE_ALPHA` will use the alpha channel of the init_image as the mask, where fully transparent pixels are completely replaced and fully opaque pixels are unchanged
public type MaskSource string;

public type Engine record {
    string description;
    # Unique identifier for the engine
    string id;
    # Name of the engine
    string name;
    # The type of content this engine produces
    string 'type;
};

# The engines available to your user/organization
public type ListEnginesResponseBody Engine[];

public type TextToImageRequestBody record {
    # Height of the image in pixels.  Must be in increments of 64 and pass the following validation:
    # - For 768 engines: <span style='display: flex; justify-content: flex-start; gap:8px'>589,824 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
    # - All other engines: <span style='display: flex; justify-content: flex-start; gap:8px'>262,144 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
    DiffuseImageHeight height?;
    # Width of the image in pixels.  Must be in increments of 64 and pass the following validation:
    # - For 768 engines: <span style='display: flex; justify-content: flex-start; gap:8px'>589,824 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
    # - All other engines: <span style='display: flex; justify-content: flex-start; gap:8px'>262,144 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
    DiffuseImageWidth width?;
    # An array of text prompts to use for generation.
    # 
    # Given a text prompt with the text `A lighthouse on a cliff` and a weight of `0.5`, it would be represented as:
    # 
    # <pre>
    # "text_prompts": [
    #   {
    #     "text": "A lighthouse on a cliff",
    #     "weight": 0.5
    #   }
    # ]
    # </pre>
    TextPromptsForTextToImage text_prompts;
    *GenerationRequestOptionalParams;
};

# Text prompt for image generation
public type TextPrompt record {
    # The prompt itself
    @constraint:String {maxLength: 2000}
    string text;
    # Weight of the prompt (use negative numbers for negative prompts)
    float weight?;
};

public type Error record {
    # A unique identifier for this particular occurrence of the problem.
    string id;
    # The short-name of this class of errors e.g. `bad_request`.
    string name;
    # A human-readable explanation specific to this occurrence of the problem.
    string message;
};

public type UpscaleImageRequestBody record {
    InputImage image;
    # Desired width of the output image.  Only one of `width` or `height` may be specified.
    UpscaleImageWidth width?;
    # Desired height of the output image.  Only one of `width` or `height` may be specified.
    UpscaleImageHeight height?;
};

public type AccountResponseBody record {
    # The user's email
    string email;
    # The user's ID
    string id;
    # The user's organizations
    OrganizationMembership[] organizations;
    # The user's profile picture
    string profile_picture?;
};

public type InputImage record {byte[] fileContent; string fileName;};

# Represents the optional parameters that can be passed to any generation request.
public type GenerationRequestOptionalParams record {
    # How strictly the diffusion process adheres to the prompt text (higher values keep your image closer to your prompt)
    CfgScale cfg_scale?;
    ClipGuidancePreset clip_guidance_preset?;
    # Which sampler to use for the diffusion process. If this value is omitted we'll automatically select an appropriate sampler for you.
    Sampler sampler?;
    # Number of images to generate
    Samples samples?;
    # Random noise seed (omit this option or use `0` for a random seed)
    Seed seed?;
    # Number of diffusion steps to run
    Steps steps?;
};

public type BalanceResponseBody record {
    # The balance of the account/organization associated with the API key
    decimal credits;
};

# Number of images to generate
@constraint:Int {minValue: 1, maxValue: 10}
public type Samples int;

# Random noise seed (omit this option or use `0` for a random seed)
@constraint:Int {maxValue: -1}
public type Seed int;

# Which sampler to use for the diffusion process. If this value is omitted we'll automatically select an appropriate sampler for you.
public type Sampler string;

public type ImageRes record {
    # Array containing one or more images as base64 encoded strings.
    Image[] artifacts;
};

# Height of the image in pixels.  Must be in increments of 64 and pass the following validation:
# - For 768 engines: <span style='display: flex; justify-content: flex-start; gap:8px'>589,824 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
# - All other engines: <span style='display: flex; justify-content: flex-start; gap:8px'>262,144 <span>≤</span> `height * width` <span>≤</span> 1,048,576</span>
@constraint:Int {minValue: 128}
public type DiffuseImageHeight int;

public type MaskingRequestBody record {
    # Image used to initialize the diffusion process, in lieu of random noise.
    InitImage init_image;
    # For any given pixel, the mask determines the strength of generation on a linear scale.  This parameter determines where to source the mask from:
    # - `MASK_IMAGE_WHITE` will use the white pixels of the mask_image as the mask, where white pixels are completely replaced and black pixels are unchanged
    # - `MASK_IMAGE_BLACK` will use the black pixels of the mask_image as the mask, where black pixels are completely replaced and white pixels are unchanged
    # - `INIT_IMAGE_ALPHA` will use the alpha channel of the init_image as the mask, where fully transparent pixels are completely replaced and fully opaque pixels are unchanged
    MaskSource mask_source;
    # Optional grayscale mask that allows for influence over which pixels are eligible for diffusion and at what strength. Must be the same dimensions as the `init_image`. Use the `mask_source` option to specify whether the white or black pixels should be inpainted.
    MaskImage mask_image?;
    string 'text_prompts\[0\]\[text\];
    float 'text_prompts\[0\]\[weight\];
    # How strictly the diffusion process adheres to the prompt text (higher values keep your image closer to your prompt)
    CfgScale cfg_scale?;
    ClipGuidancePreset clip_guidance_preset?;
    # Which sampler to use for the diffusion process. If this value is omitted we'll automatically select an appropriate sampler for you.
    Sampler sampler?;
    # Number of images to generate
    Samples samples?;
    # Random noise seed (omit this option or use `0` for a random seed)
    Seed seed?;
    # Number of diffusion steps to run
    Steps steps?;
};
