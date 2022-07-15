
(cffi:defcfun ("vkCreateInstance" vkCreateInstance) VkResult 
  (pCreateInfo (:pointer VkInstanceCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pInstance (:pointer VkInstance)))

(cffi:defcfun ("vkDestroyInstance" vkDestroyInstance) :void 
  (instance VkInstance)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkEnumeratePhysicalDevices" vkEnumeratePhysicalDevices) VkResult 
  (instance VkInstance)
  (pPhysicalDeviceCount (:pointer :uint32))
  (pPhysicalDevices (:pointer VkPhysicalDevice)))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures" vkGetPhysicalDeviceFeatures) :void 
  (physicalDevice VkPhysicalDevice)
  (pFeatures (:pointer VkPhysicalDeviceFeatures)))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties" vkGetPhysicalDeviceFormatProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (format VkFormat)
  (pFormatProperties (:pointer VkFormatProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties" vkGetPhysicalDeviceImageFormatProperties) VkResult 
  (physicalDevice VkPhysicalDevice)
  (format VkFormat)
  (type VkImageType)
  (tiling VkImageTiling)
  (usage VkImageUsageFlags)
  (flags VkImageCreateFlags)
  (pImageFormatProperties (:pointer VkImageFormatProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceProperties" vkGetPhysicalDeviceProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (pProperties (:pointer VkPhysicalDeviceProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties" vkGetPhysicalDeviceQueueFamilyProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (pQueueFamilyPropertyCount (:pointer :uint32))
  (pQueueFamilyProperties (:pointer VkQueueFamilyProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties" vkGetPhysicalDeviceMemoryProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (pMemoryProperties (:pointer VkPhysicalDeviceMemoryProperties)))

(cffi:defcfun ("vkGetInstanceProcAddr" vkGetInstanceProcAddr) PFN_vkVoidFunction 
  (instance VkInstance)
  (pName (:pointer :char)))

(cffi:defcfun ("vkGetDeviceProcAddr" vkGetDeviceProcAddr) PFN_vkVoidFunction 
  (device VkDevice)
  (pName (:pointer :char)))

(cffi:defcfun ("vkCreateDevice" vkCreateDevice) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pCreateInfo (:pointer VkDeviceCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pDevice (:pointer VkDevice)))

(cffi:defcfun ("vkDestroyDevice" vkDestroyDevice) :void 
  (device VkDevice)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkEnumerateInstanceExtensionProperties" vkEnumerateInstanceExtensionProperties) VkResult 
  (pLayerName (:pointer :char))
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkExtensionProperties)))

(cffi:defcfun ("vkEnumerateDeviceExtensionProperties" vkEnumerateDeviceExtensionProperties) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pLayerName (:pointer :char))
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkExtensionProperties)))

(cffi:defcfun ("vkEnumerateInstanceLayerProperties" vkEnumerateInstanceLayerProperties) VkResult 
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkLayerProperties)))

(cffi:defcfun ("vkEnumerateDeviceLayerProperties" vkEnumerateDeviceLayerProperties) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkLayerProperties)))

(cffi:defcfun ("vkGetDeviceQueue" vkGetDeviceQueue) :void 
  (device VkDevice)
  (queueFamilyIndex :uint32)
  (queueIndex :uint32)
  (pQueue (:pointer VkQueue)))

(cffi:defcfun ("vkQueueSubmit" vkQueueSubmit) VkResult 
  (queue VkQueue)
  (submitCount :uint32)
  (pSubmits (:pointer VkSubmitInfo))
  (fence VkFence))

(cffi:defcfun ("vkQueueWaitIdle" vkQueueWaitIdle) VkResult 
  (queue VkQueue))

(cffi:defcfun ("vkDeviceWaitIdle" vkDeviceWaitIdle) VkResult 
  (device VkDevice))

(cffi:defcfun ("vkAllocateMemory" vkAllocateMemory) VkResult 
  (device VkDevice)
  (pAllocateInfo (:pointer VkMemoryAllocateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pMemory (:pointer VkDeviceMemory)))

(cffi:defcfun ("vkFreeMemory" vkFreeMemory) :void 
  (device VkDevice)
  (memory VkDeviceMemory)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkMapMemory" vkMapMemory) VkResult 
  (device VkDevice)
  (memory VkDeviceMemory)
  (offset VkDeviceSize)
  (size VkDeviceSize)
  (flags VkMemoryMapFlags)
  (* (:pointer :void))                                      ppData)

(cffi:defcfun ("vkUnmapMemory" vkUnmapMemory) :void 
  (device VkDevice)
  (memory VkDeviceMemory))

(cffi:defcfun ("vkFlushMappedMemoryRanges" vkFlushMappedMemoryRanges) VkResult 
  (device VkDevice)
  (memoryRangeCount :uint32)
  (pMemoryRanges (:pointer VkMappedMemoryRange)))

(cffi:defcfun ("vkInvalidateMappedMemoryRanges" vkInvalidateMappedMemoryRanges) VkResult 
  (device VkDevice)
  (memoryRangeCount :uint32)
  (pMemoryRanges (:pointer VkMappedMemoryRange)))

(cffi:defcfun ("vkGetDeviceMemoryCommitment" vkGetDeviceMemoryCommitment) :void 
  (device VkDevice)
  (memory VkDeviceMemory)
  (pCommittedMemoryInBytes (:pointer VkDeviceSize)))

(cffi:defcfun ("vkBindBufferMemory" vkBindBufferMemory) VkResult 
  (device VkDevice)
  (buffer VkBuffer)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize))

(cffi:defcfun ("vkBindImageMemory" vkBindImageMemory) VkResult 
  (device VkDevice)
  (image VkImage)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize))

(cffi:defcfun ("vkGetBufferMemoryRequirements" vkGetBufferMemoryRequirements) :void 
  (device VkDevice)
  (buffer VkBuffer)
  (pMemoryRequirements (:pointer VkMemoryRequirements)))

(cffi:defcfun ("vkGetImageMemoryRequirements" vkGetImageMemoryRequirements) :void 
  (device VkDevice)
  (image VkImage)
  (pMemoryRequirements (:pointer VkMemoryRequirements)))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements" vkGetImageSparseMemoryRequirements) :void 
  (device VkDevice)
  (image VkImage)
  (pSparseMemoryRequirementCount (:pointer :uint32))
  (pSparseMemoryRequirements (:pointer VkSparseImageMemoryRequirements)))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties" vkGetPhysicalDeviceSparseImageFormatProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (format VkFormat)
  (type VkImageType)
  (samples VkSampleCountFlagBits)
  (usage VkImageUsageFlags)
  (tiling VkImageTiling)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkSparseImageFormatProperties)))

(cffi:defcfun ("vkQueueBindSparse" vkQueueBindSparse) VkResult 
  (queue VkQueue)
  (bindInfoCount :uint32)
  (pBindInfo (:pointer VkBindSparseInfo))
  (fence VkFence))

(cffi:defcfun ("vkCreateFence" vkCreateFence) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkFenceCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pFence (:pointer VkFence)))

(cffi:defcfun ("vkDestroyFence" vkDestroyFence) :void 
  (device VkDevice)
  (fence VkFence)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkResetFences" vkResetFences) VkResult 
  (device VkDevice)
  (fenceCount :uint32)
  (pFences (:pointer VkFence)))

(cffi:defcfun ("vkGetFenceStatus" vkGetFenceStatus) VkResult 
  (device VkDevice)
  (fence VkFence))

(cffi:defcfun ("vkWaitForFences" vkWaitForFences) VkResult 
  (device VkDevice)
  (fenceCount :uint32)
  (pFences (:pointer VkFence))
  (waitAll VkBool32)
  (timeout :uint64))

(cffi:defcfun ("vkCreateSemaphore" vkCreateSemaphore) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkSemaphoreCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSemaphore (:pointer VkSemaphore)))

(cffi:defcfun ("vkDestroySemaphore" vkDestroySemaphore) :void 
  (device VkDevice)
  (semaphore VkSemaphore)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateEvent" vkCreateEvent) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkEventCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pEvent (:pointer VkEvent)))

(cffi:defcfun ("vkDestroyEvent" vkDestroyEvent) :void 
  (device VkDevice)
  (event VkEvent)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetEventStatus" vkGetEventStatus) VkResult 
  (device VkDevice)
  (event VkEvent))

(cffi:defcfun ("vkSetEvent" vkSetEvent) VkResult 
  (device VkDevice)
  (event VkEvent))

(cffi:defcfun ("vkResetEvent" vkResetEvent) VkResult 
  (device VkDevice)
  (event VkEvent))

(cffi:defcfun ("vkCreateQueryPool" vkCreateQueryPool) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkQueryPoolCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pQueryPool (:pointer VkQueryPool)))

(cffi:defcfun ("vkDestroyQueryPool" vkDestroyQueryPool) :void 
  (device VkDevice)
  (queryPool VkQueryPool)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetQueryPoolResults" vkGetQueryPoolResults) VkResult 
  (device VkDevice)
  (queryPool VkQueryPool)
  (firstQuery :uint32)
  (queryCount :uint32)
  (dataSize :size)
  (pData (:pointer :void))
  (stride VkDeviceSize)
  (flags VkQueryResultFlags))

(cffi:defcfun ("vkCreateBuffer" vkCreateBuffer) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkBufferCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pBuffer (:pointer VkBuffer)))

(cffi:defcfun ("vkDestroyBuffer" vkDestroyBuffer) :void 
  (device VkDevice)
  (buffer VkBuffer)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateBufferView" vkCreateBufferView) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkBufferViewCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pView (:pointer VkBufferView)))

(cffi:defcfun ("vkDestroyBufferView" vkDestroyBufferView) :void 
  (device VkDevice)
  (bufferView VkBufferView)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateImage" vkCreateImage) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkImageCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pImage (:pointer VkImage)))

(cffi:defcfun ("vkDestroyImage" vkDestroyImage) :void 
  (device VkDevice)
  (image VkImage)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetImageSubresourceLayout" vkGetImageSubresourceLayout) :void 
  (device VkDevice)
  (image VkImage)
  (pSubresource (:pointer VkImageSubresource))
  (pLayout (:pointer VkSubresourceLayout)))

(cffi:defcfun ("vkCreateImageView" vkCreateImageView) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkImageViewCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pView (:pointer VkImageView)))

(cffi:defcfun ("vkDestroyImageView" vkDestroyImageView) :void 
  (device VkDevice)
  (imageView VkImageView)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateShaderModule" vkCreateShaderModule) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkShaderModuleCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pShaderModule (:pointer VkShaderModule)))

(cffi:defcfun ("vkDestroyShaderModule" vkDestroyShaderModule) :void 
  (device VkDevice)
  (shaderModule VkShaderModule)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreatePipelineCache" vkCreatePipelineCache) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkPipelineCacheCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPipelineCache (:pointer VkPipelineCache)))

(cffi:defcfun ("vkDestroyPipelineCache" vkDestroyPipelineCache) :void 
  (device VkDevice)
  (pipelineCache VkPipelineCache)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetPipelineCacheData" vkGetPipelineCacheData) VkResult 
  (device VkDevice)
  (pipelineCache VkPipelineCache)
  (pDataSize (:pointer :size))
  (pData (:pointer :void)))

(cffi:defcfun ("vkMergePipelineCaches" vkMergePipelineCaches) VkResult 
  (device VkDevice)
  (dstCache VkPipelineCache)
  (srcCacheCount :uint32)
  (pSrcCaches (:pointer VkPipelineCache)))

(cffi:defcfun ("vkCreateGraphicsPipelines" vkCreateGraphicsPipelines) VkResult 
  (device VkDevice)
  (pipelineCache VkPipelineCache)
  (createInfoCount :uint32)
  (pCreateInfos (:pointer VkGraphicsPipelineCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPipelines (:pointer VkPipeline)))

(cffi:defcfun ("vkCreateComputePipelines" vkCreateComputePipelines) VkResult 
  (device VkDevice)
  (pipelineCache VkPipelineCache)
  (createInfoCount :uint32)
  (pCreateInfos (:pointer VkComputePipelineCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPipelines (:pointer VkPipeline)))

(cffi:defcfun ("vkDestroyPipeline" vkDestroyPipeline) :void 
  (device VkDevice)
  (pipeline VkPipeline)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreatePipelineLayout" vkCreatePipelineLayout) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkPipelineLayoutCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPipelineLayout (:pointer VkPipelineLayout)))

(cffi:defcfun ("vkDestroyPipelineLayout" vkDestroyPipelineLayout) :void 
  (device VkDevice)
  (pipelineLayout VkPipelineLayout)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateSampler" vkCreateSampler) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkSamplerCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSampler (:pointer VkSampler)))

(cffi:defcfun ("vkDestroySampler" vkDestroySampler) :void 
  (device VkDevice)
  (sampler VkSampler)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateDescriptorSetLayout" vkCreateDescriptorSetLayout) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkDescriptorSetLayoutCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSetLayout (:pointer VkDescriptorSetLayout)))

(cffi:defcfun ("vkDestroyDescriptorSetLayout" vkDestroyDescriptorSetLayout) :void 
  (device VkDevice)
  (descriptorSetLayout VkDescriptorSetLayout)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateDescriptorPool" vkCreateDescriptorPool) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkDescriptorPoolCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pDescriptorPool (:pointer VkDescriptorPool)))

(cffi:defcfun ("vkDestroyDescriptorPool" vkDestroyDescriptorPool) :void 
  (device VkDevice)
  (descriptorPool VkDescriptorPool)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkResetDescriptorPool" vkResetDescriptorPool) VkResult 
  (device VkDevice)
  (descriptorPool VkDescriptorPool)
  (flags VkDescriptorPoolResetFlags))

(cffi:defcfun ("vkAllocateDescriptorSets" vkAllocateDescriptorSets) VkResult 
  (device VkDevice)
  (pAllocateInfo (:pointer VkDescriptorSetAllocateInfo))
  (pDescriptorSets (:pointer VkDescriptorSet)))

(cffi:defcfun ("vkFreeDescriptorSets" vkFreeDescriptorSets) VkResult 
  (device VkDevice)
  (descriptorPool VkDescriptorPool)
  (descriptorSetCount :uint32)
  (pDescriptorSets (:pointer VkDescriptorSet)))

(cffi:defcfun ("vkUpdateDescriptorSets" vkUpdateDescriptorSets) :void 
  (device VkDevice)
  (descriptorWriteCount :uint32)
  (pDescriptorWrites (:pointer VkWriteDescriptorSet))
  (descriptorCopyCount :uint32)
  (pDescriptorCopies (:pointer VkCopyDescriptorSet)))

(cffi:defcfun ("vkCreateFramebuffer" vkCreateFramebuffer) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkFramebufferCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pFramebuffer (:pointer VkFramebuffer)))

(cffi:defcfun ("vkDestroyFramebuffer" vkDestroyFramebuffer) :void 
  (device VkDevice)
  (framebuffer VkFramebuffer)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateRenderPass" vkCreateRenderPass) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkRenderPassCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pRenderPass (:pointer VkRenderPass)))

(cffi:defcfun ("vkDestroyRenderPass" vkDestroyRenderPass) :void 
  (device VkDevice)
  (renderPass VkRenderPass)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetRenderAreaGranularity" vkGetRenderAreaGranularity) :void 
  (device VkDevice)
  (renderPass VkRenderPass)
  (pGranularity (:pointer VkExtent2D)))

(cffi:defcfun ("vkCreateCommandPool" vkCreateCommandPool) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkCommandPoolCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pCommandPool (:pointer VkCommandPool)))

(cffi:defcfun ("vkDestroyCommandPool" vkDestroyCommandPool) :void 
  (device VkDevice)
  (commandPool VkCommandPool)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkResetCommandPool" vkResetCommandPool) VkResult 
  (device VkDevice)
  (commandPool VkCommandPool)
  (flags VkCommandPoolResetFlags))

(cffi:defcfun ("vkAllocateCommandBuffers" vkAllocateCommandBuffers) VkResult 
  (device VkDevice)
  (pAllocateInfo (:pointer VkCommandBufferAllocateInfo))
  (pCommandBuffers (:pointer VkCommandBuffer)))

(cffi:defcfun ("vkFreeCommandBuffers" vkFreeCommandBuffers) :void 
  (device VkDevice)
  (commandPool VkCommandPool)
  (commandBufferCount :uint32)
  (pCommandBuffers (:pointer VkCommandBuffer)))

(cffi:defcfun ("vkBeginCommandBuffer" vkBeginCommandBuffer) VkResult 
  (commandBuffer VkCommandBuffer)
  (pBeginInfo (:pointer VkCommandBufferBeginInfo)))

(cffi:defcfun ("vkEndCommandBuffer" vkEndCommandBuffer) VkResult 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkResetCommandBuffer" vkResetCommandBuffer) VkResult 
  (commandBuffer VkCommandBuffer)
  (flags VkCommandBufferResetFlags))

(cffi:defcfun ("vkCmdBindPipeline" vkCmdBindPipeline) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineBindPoint VkPipelineBindPoint)
  (pipeline VkPipeline))

(cffi:defcfun ("vkCmdSetViewport" vkCmdSetViewport) :void 
  (commandBuffer VkCommandBuffer)
  (firstViewport :uint32)
  (viewportCount :uint32)
  (pViewports (:pointer VkViewport)))

(cffi:defcfun ("vkCmdSetScissor" vkCmdSetScissor) :void 
  (commandBuffer VkCommandBuffer)
  (firstScissor :uint32)
  (scissorCount :uint32)
  (pScissors (:pointer VkRect2D)))

(cffi:defcfun ("vkCmdSetLineWidth" vkCmdSetLineWidth) :void 
  (commandBuffer VkCommandBuffer)
  (lineWidth :float))

(cffi:defcfun ("vkCmdSetDepthBias" vkCmdSetDepthBias) :void 
  (commandBuffer VkCommandBuffer)
  (ntFactor :float)
  (depthBiasClamp :float)
  (depthBiasSlopeFactor :float))

(cffi:defcfun ("nts" nts) :void 
  (commandBuffer VkCommandBuffer)
  (blendConstants[4] :float))

(cffi:defcfun ("vkCmdSetDepthBounds" vkCmdSetDepthBounds) :void 
  (commandBuffer VkCommandBuffer)
  (minDepthBounds :float)
  (maxDepthBounds :float))

(cffi:defcfun ("vkCmdSetStencilCompareMask" vkCmdSetStencilCompareMask) :void 
  (commandBuffer VkCommandBuffer)
  (faceMask VkStencilFaceFlags)
  (compareMask :uint32))

(cffi:defcfun ("vkCmdSetStencilWriteMask" vkCmdSetStencilWriteMask) :void 
  (commandBuffer VkCommandBuffer)
  (faceMask VkStencilFaceFlags)
  (writeMask :uint32))

(cffi:defcfun ("vkCmdSetStencilReference" vkCmdSetStencilReference) :void 
  (commandBuffer VkCommandBuffer)
  (faceMask VkStencilFaceFlags)
  (reference :uint32))

(cffi:defcfun ("vkCmdBindDescriptorSets" vkCmdBindDescriptorSets) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineBindPoint VkPipelineBindPoint)
  (layout VkPipelineLayout)
  (firstSet :uint32)
  (descriptorSetCount :uint32)
  (pDescriptorSets (:pointer VkDescriptorSet))
  (dynamicOffsetCount :uint32)
  (pDynamicOffsets (:pointer :uint32)))

(cffi:defcfun ("vkCmdBindIndexBuffer" vkCmdBindIndexBuffer) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (indexType VkIndexType))

(cffi:defcfun ("vkCmdBindVertexBuffers" vkCmdBindVertexBuffers) :void 
  (commandBuffer VkCommandBuffer)
  (firstBinding :uint32)
  (bindingCount :uint32)
  (pBuffers (:pointer VkBuffer))
  (pOffsets (:pointer VkDeviceSize)))

(cffi:defcfun ("vkCmdDraw" vkCmdDraw) :void 
  (commandBuffer VkCommandBuffer)
  (vertexCount :uint32)
  (instanceCount :uint32)
  (firstVertex :uint32)
  (firstInstance :uint32))

(cffi:defcfun ("vkCmdDrawIndexed" vkCmdDrawIndexed) :void 
  (commandBuffer VkCommandBuffer)
  (indexCount :uint32)
  (instanceCount :uint32)
  (firstIndex :uint32)
  (vertexOffset :int32)
  (firstInstance :uint32))

(cffi:defcfun ("vkCmdDrawIndirect" vkCmdDrawIndirect) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (drawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirect" vkCmdDrawIndexedIndirect) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (drawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDispatch" vkCmdDispatch) :void 
  (commandBuffer VkCommandBuffer)
  (groupCountX :uint32)
  (groupCountY :uint32)
  (groupCountZ :uint32))

(cffi:defcfun ("vkCmdDispatchIndirect" vkCmdDispatchIndirect) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize))

(cffi:defcfun ("vkCmdCopyBuffer" vkCmdCopyBuffer) :void 
  (commandBuffer VkCommandBuffer)
  (srcBuffer VkBuffer)
  (dstBuffer VkBuffer)
  (regionCount :uint32)
  (pRegions (:pointer VkBufferCopy)))

(cffi:defcfun ("vkCmdCopyImage" vkCmdCopyImage) :void 
  (commandBuffer VkCommandBuffer)
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkImageCopy)))

(cffi:defcfun ("vkCmdBlitImage" vkCmdBlitImage) :void 
  (commandBuffer VkCommandBuffer)
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkImageBlit))
  (filter VkFilter))

(cffi:defcfun ("vkCmdCopyBufferToImage" vkCmdCopyBufferToImage) :void 
  (commandBuffer VkCommandBuffer)
  (srcBuffer VkBuffer)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkBufferImageCopy)))

(cffi:defcfun ("vkCmdCopyImageToBuffer" vkCmdCopyImageToBuffer) :void 
  (commandBuffer VkCommandBuffer)
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstBuffer VkBuffer)
  (regionCount :uint32)
  (pRegions (:pointer VkBufferImageCopy)))

(cffi:defcfun ("vkCmdUpdateBuffer" vkCmdUpdateBuffer) :void 
  (commandBuffer VkCommandBuffer)
  (dstBuffer VkBuffer)
  (dstOffset VkDeviceSize)
  (dataSize VkDeviceSize)
  (pData (:pointer :void)))

(cffi:defcfun ("vkCmdFillBuffer" vkCmdFillBuffer) :void 
  (commandBuffer VkCommandBuffer)
  (dstBuffer VkBuffer)
  (dstOffset VkDeviceSize)
  (size VkDeviceSize)
  (data :uint32))

(cffi:defcfun ("vkCmdClearColorImage" vkCmdClearColorImage) :void 
  (commandBuffer VkCommandBuffer)
  (image VkImage)
  (imageLayout VkImageLayout)
  (pColor (:pointer VkClearColorValue))
  (rangeCount :uint32)
  (pRanges (:pointer VkImageSubresourceRange)))

(cffi:defcfun ("vkCmdClearDepthStencilImage" vkCmdClearDepthStencilImage) :void 
  (commandBuffer VkCommandBuffer)
  (image VkImage)
  (imageLayout VkImageLayout)
  (pDepthStencil (:pointer VkClearDepthStencilValue))
  (rangeCount :uint32)
  (pRanges (:pointer VkImageSubresourceRange)))

(cffi:defcfun ("vkCmdClearAttachments" vkCmdClearAttachments) :void 
  (commandBuffer VkCommandBuffer)
  (attachmentCount :uint32)
  (pAttachments (:pointer VkClearAttachment))
  (rectCount :uint32)
  (pRects (:pointer VkClearRect)))

(cffi:defcfun ("vkCmdResolveImage" vkCmdResolveImage) :void 
  (commandBuffer VkCommandBuffer)
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkImageResolve)))

(cffi:defcfun ("vkCmdSetEvent" vkCmdSetEvent) :void 
  (commandBuffer VkCommandBuffer)
  (event VkEvent)
  (stageMask VkPipelineStageFlags))

(cffi:defcfun ("vkCmdResetEvent" vkCmdResetEvent) :void 
  (commandBuffer VkCommandBuffer)
  (event VkEvent)
  (stageMask VkPipelineStageFlags))

(cffi:defcfun ("vkCmdWaitEvents" vkCmdWaitEvents) :void 
  (commandBuffer VkCommandBuffer)
  (eventCount :uint32)
  (pEvents (:pointer VkEvent))
  (srcStageMask VkPipelineStageFlags)
  (dstStageMask VkPipelineStageFlags)
  (memoryBarrierCount :uint32)
  (pMemoryBarriers (:pointer VkMemoryBarrier))
  (bufferMemoryBarrierCount :uint32)
  (pBufferMemoryBarriers (:pointer VkBufferMemoryBarrier))
  (imageMemoryBarrierCount :uint32)
  (pImageMemoryBarriers (:pointer VkImageMemoryBarrier)))

(cffi:defcfun ("vkCmdPipelineBarrier" vkCmdPipelineBarrier) :void 
  (commandBuffer VkCommandBuffer)
  (srcStageMask VkPipelineStageFlags)
  (dstStageMask VkPipelineStageFlags)
  (dependencyFlags VkDependencyFlags)
  (memoryBarrierCount :uint32)
  (pMemoryBarriers (:pointer VkMemoryBarrier))
  (bufferMemoryBarrierCount :uint32)
  (pBufferMemoryBarriers (:pointer VkBufferMemoryBarrier))
  (imageMemoryBarrierCount :uint32)
  (pImageMemoryBarriers (:pointer VkImageMemoryBarrier)))

(cffi:defcfun ("vkCmdBeginQuery" vkCmdBeginQuery) :void 
  (commandBuffer VkCommandBuffer)
  (queryPool VkQueryPool)
  (query :uint32)
  (flags VkQueryControlFlags))

(cffi:defcfun ("vkCmdEndQuery" vkCmdEndQuery) :void 
  (commandBuffer VkCommandBuffer)
  (queryPool VkQueryPool)
  (query :uint32))

(cffi:defcfun ("vkCmdResetQueryPool" vkCmdResetQueryPool) :void 
  (commandBuffer VkCommandBuffer)
  (queryPool VkQueryPool)
  (firstQuery :uint32)
  (queryCount :uint32))

(cffi:defcfun ("vkCmdWriteTimestamp" vkCmdWriteTimestamp) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineStage VkPipelineStageFlagBits)
  (queryPool VkQueryPool)
  (query :uint32))

(cffi:defcfun ("vkCmdCopyQueryPoolResults" vkCmdCopyQueryPoolResults) :void 
  (commandBuffer VkCommandBuffer)
  (queryPool VkQueryPool)
  (firstQuery :uint32)
  (queryCount :uint32)
  (dstBuffer VkBuffer)
  (dstOffset VkDeviceSize)
  (stride VkDeviceSize)
  (flags VkQueryResultFlags))

(cffi:defcfun ("nts" nts) :void 
  (commandBuffer VkCommandBuffer)
  (layout VkPipelineLayout)
  (stageFlags VkShaderStageFlags)
  (offset :uint32)
  (size :uint32)
  (pValues (:pointer :void)))

(cffi:defcfun ("vkCmdBeginRenderPass" vkCmdBeginRenderPass) :void 
  (commandBuffer VkCommandBuffer)
  (pRenderPassBegin (:pointer VkRenderPassBeginInfo))
  (contents VkSubpassContents))

(cffi:defcfun ("vkCmdNextSubpass" vkCmdNextSubpass) :void 
  (commandBuffer VkCommandBuffer)
  (contents VkSubpassContents))

(cffi:defcfun ("vkCmdEndRenderPass" vkCmdEndRenderPass) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkCmdExecuteCommands" vkCmdExecuteCommands) :void 
  (commandBuffer VkCommandBuffer)
  (commandBufferCount :uint32)
  (pCommandBuffers (:pointer VkCommandBuffer)))

(cffi:defcfun ("vkEnumerateInstanceVersion" vkEnumerateInstanceVersion) VkResult 
  (pApiVersion (:pointer :uint32)))

(cffi:defcfun ("vkBindBufferMemory2" vkBindBufferMemory2) VkResult 
  (device VkDevice)
  (bindInfoCount :uint32)
  (pBindInfos (:pointer VkBindBufferMemoryInfo)))

(cffi:defcfun ("vkBindImageMemory2" vkBindImageMemory2) VkResult 
  (device VkDevice)
  (bindInfoCount :uint32)
  (pBindInfos (:pointer VkBindImageMemoryInfo)))

(cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeatures" vkGetDeviceGroupPeerMemoryFeatures) :void 
  (device VkDevice)
  (heapIndex :uint32)
  (localDeviceIndex :uint32)
  (remoteDeviceIndex :uint32)
  (pPeerMemoryFeatures (:pointer VkPeerMemoryFeatureFlags)))

(cffi:defcfun ("vkCmdSetDeviceMask" vkCmdSetDeviceMask) :void 
  (commandBuffer VkCommandBuffer)
  (deviceMask :uint32))

(cffi:defcfun ("vkCmdDispatchBase" vkCmdDispatchBase) :void 
  (commandBuffer VkCommandBuffer)
  (baseGroupX :uint32)
  (baseGroupY :uint32)
  (baseGroupZ :uint32)
  (groupCountX :uint32)
  (groupCountY :uint32)
  (groupCountZ :uint32))

(cffi:defcfun ("vkEnumeratePhysicalDeviceGroups" vkEnumeratePhysicalDeviceGroups) VkResult 
  (instance VkInstance)
  (pPhysicalDeviceGroupCount (:pointer :uint32))
  (pPhysicalDeviceGroupProperties (:pointer VkPhysicalDeviceGroupProperties)))

(cffi:defcfun ("vkGetImageMemoryRequirements2" vkGetImageMemoryRequirements2) :void 
  (device VkDevice)
  (pInfo (:pointer VkImageMemoryRequirementsInfo2))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetBufferMemoryRequirements2" vkGetBufferMemoryRequirements2) :void 
  (device VkDevice)
  (pInfo (:pointer VkBufferMemoryRequirementsInfo2))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements2" vkGetImageSparseMemoryRequirements2) :void 
  (device VkDevice)
  (pInfo (:pointer VkImageSparseMemoryRequirementsInfo2))
  (pSparseMemoryRequirementCount (:pointer :uint32))
  (pSparseMemoryRequirements (:pointer VkSparseImageMemoryRequirements2)))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures2" vkGetPhysicalDeviceFeatures2) :void 
  (physicalDevice VkPhysicalDevice)
  (pFeatures (:pointer VkPhysicalDeviceFeatures2)))

(cffi:defcfun ("vkGetPhysicalDeviceProperties2" vkGetPhysicalDeviceProperties2) :void 
  (physicalDevice VkPhysicalDevice)
  (pProperties (:pointer VkPhysicalDeviceProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2" vkGetPhysicalDeviceFormatProperties2) :void 
  (physicalDevice VkPhysicalDevice)
  (format VkFormat)
  (pFormatProperties (:pointer VkFormatProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2" vkGetPhysicalDeviceImageFormatProperties2) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pImageFormatInfo (:pointer VkPhysicalDeviceImageFormatInfo2))
  (pImageFormatProperties (:pointer VkImageFormatProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2" vkGetPhysicalDeviceQueueFamilyProperties2) :void 
  (physicalDevice VkPhysicalDevice)
  (pQueueFamilyPropertyCount (:pointer :uint32))
  (pQueueFamilyProperties (:pointer VkQueueFamilyProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2" vkGetPhysicalDeviceMemoryProperties2) :void 
  (physicalDevice VkPhysicalDevice)
  (pMemoryProperties (:pointer VkPhysicalDeviceMemoryProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2" vkGetPhysicalDeviceSparseImageFormatProperties2) :void 
  (physicalDevice VkPhysicalDevice)
  (pFormatInfo (:pointer VkPhysicalDeviceSparseImageFormatInfo2))
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkSparseImageFormatProperties2)))

(cffi:defcfun ("vkTrimCommandPool" vkTrimCommandPool) :void 
  (device VkDevice)
  (commandPool VkCommandPool)
  (flags VkCommandPoolTrimFlags))

(cffi:defcfun ("vkGetDeviceQueue2" vkGetDeviceQueue2) :void 
  (device VkDevice)
  (pQueueInfo (:pointer VkDeviceQueueInfo2))
  (pQueue (:pointer VkQueue)))

(cffi:defcfun ("vkCreateSamplerYcbcrConversion" vkCreateSamplerYcbcrConversion) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkSamplerYcbcrConversionCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pYcbcrConversion (:pointer VkSamplerYcbcrConversion)))

(cffi:defcfun ("vkDestroySamplerYcbcrConversion" vkDestroySamplerYcbcrConversion) :void 
  (device VkDevice)
  (ycbcrConversion VkSamplerYcbcrConversion)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCreateDescriptorUpdateTemplate" vkCreateDescriptorUpdateTemplate) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkDescriptorUpdateTemplateCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pDescriptorUpdateTemplate (:pointer VkDescriptorUpdateTemplate)))

(cffi:defcfun ("vkDestroyDescriptorUpdateTemplate" vkDestroyDescriptorUpdateTemplate) :void 
  (device VkDevice)
  (descriptorUpdateTemplate VkDescriptorUpdateTemplate)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkUpdateDescriptorSetWithTemplate" vkUpdateDescriptorSetWithTemplate) :void 
  (device VkDevice)
  (descriptorSet VkDescriptorSet)
  (descriptorUpdateTemplate VkDescriptorUpdateTemplate)
  (pData (:pointer :void)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalBufferProperties" vkGetPhysicalDeviceExternalBufferProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (pExternalBufferInfo (:pointer VkPhysicalDeviceExternalBufferInfo))
  (pExternalBufferProperties (:pointer VkExternalBufferProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalFenceProperties" vkGetPhysicalDeviceExternalFenceProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (pExternalFenceInfo (:pointer VkPhysicalDeviceExternalFenceInfo))
  (pExternalFenceProperties (:pointer VkExternalFenceProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphoreProperties" vkGetPhysicalDeviceExternalSemaphoreProperties) :void 
  (physicalDevice VkPhysicalDevice)
  (pExternalSemaphoreInfo (:pointer VkPhysicalDeviceExternalSemaphoreInfo))
  (pExternalSemaphoreProperties (:pointer VkExternalSemaphoreProperties)))

(cffi:defcfun ("vkGetDescriptorSetLayoutSupport" vkGetDescriptorSetLayoutSupport) :void 
  (device VkDevice)
  (pCreateInfo (:pointer VkDescriptorSetLayoutCreateInfo))
  (pSupport (:pointer VkDescriptorSetLayoutSupport)))

(cffi:defcfun ("vkCmdDrawIndirectCount" vkCmdDrawIndirectCount) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirectCount" vkCmdDrawIndexedIndirectCount) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCreateRenderPass2" vkCreateRenderPass2) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkRenderPassCreateInfo2))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pRenderPass (:pointer VkRenderPass)))

(cffi:defcfun ("vkCmdBeginRenderPass2" vkCmdBeginRenderPass2) :void 
  (commandBuffer VkCommandBuffer)
  (pRenderPassBegin (:pointer VkRenderPassBeginInfo))
  (pSubpassBeginInfo (:pointer VkSubpassBeginInfo)))

(cffi:defcfun ("vkCmdNextSubpass2" vkCmdNextSubpass2) :void 
  (commandBuffer VkCommandBuffer)
  (pSubpassBeginInfo (:pointer VkSubpassBeginInfo))
  (pSubpassEndInfo (:pointer VkSubpassEndInfo)))

(cffi:defcfun ("vkCmdEndRenderPass2" vkCmdEndRenderPass2) :void 
  (commandBuffer VkCommandBuffer)
  (pSubpassEndInfo (:pointer VkSubpassEndInfo)))

(cffi:defcfun ("vkResetQueryPool" vkResetQueryPool) :void 
  (device VkDevice)
  (queryPool VkQueryPool)
  (firstQuery :uint32)
  (queryCount :uint32))

(cffi:defcfun ("vkGetSemaphoreCounterValue" vkGetSemaphoreCounterValue) VkResult 
  (device VkDevice)
  (semaphore VkSemaphore)
  (pValue (:pointer :uint64)))

(cffi:defcfun ("vkWaitSemaphores" vkWaitSemaphores) VkResult 
  (device VkDevice)
  (pWaitInfo (:pointer VkSemaphoreWaitInfo))
  (timeout :uint64))

(cffi:defcfun ("vkSignalSemaphore" vkSignalSemaphore) VkResult 
  (device VkDevice)
  (pSignalInfo (:pointer VkSemaphoreSignalInfo)))

(cffi:defcfun ("vkGetBufferDeviceAddress" vkGetBufferDeviceAddress) VkDeviceAddress 
  (device VkDevice)
  (pInfo (:pointer VkBufferDeviceAddressInfo)))

(cffi:defcfun ("vkGetBufferOpaqueCaptureAddress" vkGetBufferOpaqueCaptureAddress) :uint64 
  (device VkDevice)
  (pInfo (:pointer VkBufferDeviceAddressInfo)))

(cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddress" vkGetDeviceMemoryOpaqueCaptureAddress) :uint64 
  (device VkDevice)
  (pInfo (:pointer VkDeviceMemoryOpaqueCaptureAddressInfo)))

(cffi:defcfun ("vkGetPhysicalDeviceToolProperties" vkGetPhysicalDeviceToolProperties) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pToolCount (:pointer :uint32))
  (pToolProperties (:pointer VkPhysicalDeviceToolProperties)))

(cffi:defcfun ("vkCreatePrivateDataSlot" vkCreatePrivateDataSlot) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkPrivateDataSlotCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPrivateDataSlot (:pointer VkPrivateDataSlot)))

(cffi:defcfun ("vkDestroyPrivateDataSlot" vkDestroyPrivateDataSlot) :void 
  (device VkDevice)
  (privateDataSlot VkPrivateDataSlot)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkSetPrivateData" vkSetPrivateData) VkResult 
  (device VkDevice)
  (objectType VkObjectType)
  (objectHandle :uint64)
  (privateDataSlot VkPrivateDataSlot)
  (data :uint64))

(cffi:defcfun ("vkGetPrivateData" vkGetPrivateData) :void 
  (device VkDevice)
  (objectType VkObjectType)
  (objectHandle :uint64)
  (privateDataSlot VkPrivateDataSlot)
  (pData (:pointer :uint64)))

(cffi:defcfun ("vkCmdSetEvent2" vkCmdSetEvent2) :void 
  (commandBuffer VkCommandBuffer)
  (event VkEvent)
  (pDependencyInfo (:pointer VkDependencyInfo)))

(cffi:defcfun ("vkCmdResetEvent2" vkCmdResetEvent2) :void 
  (commandBuffer VkCommandBuffer)
  (event VkEvent)
  (stageMask VkPipelineStageFlags2))

(cffi:defcfun ("vkCmdWaitEvents2" vkCmdWaitEvents2) :void 
  (commandBuffer VkCommandBuffer)
  (eventCount :uint32)
  (pEvents (:pointer VkEvent))
  (pDependencyInfos (:pointer VkDependencyInfo)))

(cffi:defcfun ("vkCmdPipelineBarrier2" vkCmdPipelineBarrier2) :void 
  (commandBuffer VkCommandBuffer)
  (pDependencyInfo (:pointer VkDependencyInfo)))

(cffi:defcfun ("vkCmdWriteTimestamp2" vkCmdWriteTimestamp2) :void 
  (commandBuffer VkCommandBuffer)
  (stage VkPipelineStageFlags2)
  (queryPool VkQueryPool)
  (query :uint32))

(cffi:defcfun ("vkQueueSubmit2" vkQueueSubmit2) VkResult 
  (queue VkQueue)
  (submitCount :uint32)
  (pSubmits (:pointer VkSubmitInfo2))
  (fence VkFence))

(cffi:defcfun ("vkCmdCopyBuffer2" vkCmdCopyBuffer2) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyBufferInfo (:pointer VkCopyBufferInfo2)))

(cffi:defcfun ("vkCmdCopyImage2" vkCmdCopyImage2) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyImageInfo (:pointer VkCopyImageInfo2)))

(cffi:defcfun ("vkCmdCopyBufferToImage2" vkCmdCopyBufferToImage2) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyBufferToImageInfo (:pointer VkCopyBufferToImageInfo2)))

(cffi:defcfun ("vkCmdCopyImageToBuffer2" vkCmdCopyImageToBuffer2) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyImageToBufferInfo (:pointer VkCopyImageToBufferInfo2)))

(cffi:defcfun ("vkCmdBlitImage2" vkCmdBlitImage2) :void 
  (commandBuffer VkCommandBuffer)
  (pBlitImageInfo (:pointer VkBlitImageInfo2)))

(cffi:defcfun ("vkCmdResolveImage2" vkCmdResolveImage2) :void 
  (commandBuffer VkCommandBuffer)
  (pResolveImageInfo (:pointer VkResolveImageInfo2)))

(cffi:defcfun ("vkCmdBeginRendering" vkCmdBeginRendering) :void 
  (commandBuffer VkCommandBuffer)
  (pRenderingInfo (:pointer VkRenderingInfo)))

(cffi:defcfun ("vkCmdEndRendering" vkCmdEndRendering) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkCmdSetCullMode" vkCmdSetCullMode) :void 
  (commandBuffer VkCommandBuffer)
  (cullMode VkCullModeFlags))

(cffi:defcfun ("vkCmdSetFrontFace" vkCmdSetFrontFace) :void 
  (commandBuffer VkCommandBuffer)
  (frontFace VkFrontFace))

(cffi:defcfun ("vkCmdSetPrimitiveTopology" vkCmdSetPrimitiveTopology) :void 
  (commandBuffer VkCommandBuffer)
  (primitiveTopology VkPrimitiveTopology))

(cffi:defcfun ("vkCmdSetViewportWithCount" vkCmdSetViewportWithCount) :void 
  (commandBuffer VkCommandBuffer)
  (viewportCount :uint32)
  (pViewports (:pointer VkViewport)))

(cffi:defcfun ("vkCmdSetScissorWithCount" vkCmdSetScissorWithCount) :void 
  (commandBuffer VkCommandBuffer)
  (scissorCount :uint32)
  (pScissors (:pointer VkRect2D)))

(cffi:defcfun ("vkCmdBindVertexBuffers2" vkCmdBindVertexBuffers2) :void 
  (commandBuffer VkCommandBuffer)
  (firstBinding :uint32)
  (bindingCount :uint32)
  (pBuffers (:pointer VkBuffer))
  (pOffsets (:pointer VkDeviceSize))
  (pSizes (:pointer VkDeviceSize))
  (pStrides (:pointer VkDeviceSize)))

(cffi:defcfun ("vkCmdSetDepthTestEnable" vkCmdSetDepthTestEnable) :void 
  (commandBuffer VkCommandBuffer)
  (depthTestEnable VkBool32))

(cffi:defcfun ("vkCmdSetDepthWriteEnable" vkCmdSetDepthWriteEnable) :void 
  (commandBuffer VkCommandBuffer)
  (depthWriteEnable VkBool32))

(cffi:defcfun ("vkCmdSetDepthCompareOp" vkCmdSetDepthCompareOp) :void 
  (commandBuffer VkCommandBuffer)
  (depthCompareOp VkCompareOp))

(cffi:defcfun ("vkCmdSetDepthBoundsTestEnable" vkCmdSetDepthBoundsTestEnable) :void 
  (commandBuffer VkCommandBuffer)
  (depthBoundsTestEnable VkBool32))

(cffi:defcfun ("vkCmdSetStencilTestEnable" vkCmdSetStencilTestEnable) :void 
  (commandBuffer VkCommandBuffer)
  (stencilTestEnable VkBool32))

(cffi:defcfun ("vkCmdSetStencilOp" vkCmdSetStencilOp) :void 
  (commandBuffer VkCommandBuffer)
  (faceMask VkStencilFaceFlags)
  (failOp VkStencilOp)
  (passOp VkStencilOp)
  (depthFailOp VkStencilOp)
  (compareOp VkCompareOp))

(cffi:defcfun ("vkCmdSetRasterizerDiscardEnable" vkCmdSetRasterizerDiscardEnable) :void 
  (commandBuffer VkCommandBuffer)
  (rasterizerDiscardEnable VkBool32))

(cffi:defcfun ("vkCmdSetDepthBiasEnable" vkCmdSetDepthBiasEnable) :void 
  (commandBuffer VkCommandBuffer)
  (depthBiasEnable VkBool32))

(cffi:defcfun ("vkCmdSetPrimitiveRestartEnable" vkCmdSetPrimitiveRestartEnable) :void 
  (commandBuffer VkCommandBuffer)
  (primitiveRestartEnable VkBool32))

(cffi:defcfun ("vkGetDeviceBufferMemoryRequirements" vkGetDeviceBufferMemoryRequirements) :void 
  (device VkDevice)
  (pInfo (:pointer VkDeviceBufferMemoryRequirements))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetDeviceImageMemoryRequirements" vkGetDeviceImageMemoryRequirements) :void 
  (device VkDevice)
  (pInfo (:pointer VkDeviceImageMemoryRequirements))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirements" vkGetDeviceImageSparseMemoryRequirements) :void 
  (device VkDevice)
  (pInfo (:pointer VkDeviceImageMemoryRequirements))
  (pSparseMemoryRequirementCount (:pointer :uint32))
  (pSparseMemoryRequirements (:pointer VkSparseImageMemoryRequirements2)))

(cffi:defcfun ("vkDestroySurfaceKHR" vkDestroySurfaceKHR) :void 
  (instance VkInstance)
  (surface VkSurfaceKHR)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceSupportKHR" vkGetPhysicalDeviceSurfaceSupportKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (queueFamilyIndex :uint32)
  (surface VkSurfaceKHR)
  (pSupported (:pointer VkBool32)))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilitiesKHR" vkGetPhysicalDeviceSurfaceCapabilitiesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (surface VkSurfaceKHR)
  (pSurfaceCapabilities (:pointer VkSurfaceCapabilitiesKHR)))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormatsKHR" vkGetPhysicalDeviceSurfaceFormatsKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (surface VkSurfaceKHR)
  (pSurfaceFormatCount (:pointer :uint32))
  (pSurfaceFormats (:pointer VkSurfaceFormatKHR)))

(cffi:defcfun ("vkGetPhysicalDeviceSurfacePresentModesKHR" vkGetPhysicalDeviceSurfacePresentModesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (surface VkSurfaceKHR)
  (pPresentModeCount (:pointer :uint32))
  (pPresentModes (:pointer VkPresentModeKHR)))

(cffi:defcfun ("vkCreateSwapchainKHR" vkCreateSwapchainKHR) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkSwapchainCreateInfoKHR))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSwapchain (:pointer VkSwapchainKHR)))

(cffi:defcfun ("vkDestroySwapchainKHR" vkDestroySwapchainKHR) :void 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetSwapchainImagesKHR" vkGetSwapchainImagesKHR) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (pSwapchainImageCount (:pointer :uint32))
  (pSwapchainImages (:pointer VkImage)))

(cffi:defcfun ("vkAcquireNextImageKHR" vkAcquireNextImageKHR) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (timeout :uint64)
  (semaphore VkSemaphore)
  (fence VkFence)
  (pImageIndex (:pointer :uint32)))

(cffi:defcfun ("vkQueuePresentKHR" vkQueuePresentKHR) VkResult 
  (queue VkQueue)
  (pPresentInfo (:pointer VkPresentInfoKHR)))

(cffi:defcfun ("vkGetDeviceGroupPresentCapabilitiesKHR" vkGetDeviceGroupPresentCapabilitiesKHR) VkResult 
  (device VkDevice)
  (pDeviceGroupPresentCapabilities (:pointer VkDeviceGroupPresentCapabilitiesKHR)))

(cffi:defcfun ("vkGetDeviceGroupSurfacePresentModesKHR" vkGetDeviceGroupSurfacePresentModesKHR) VkResult 
  (device VkDevice)
  (surface VkSurfaceKHR)
  (pModes (:pointer VkDeviceGroupPresentModeFlagsKHR)))

(cffi:defcfun ("vkGetPhysicalDevicePresentRectanglesKHR" vkGetPhysicalDevicePresentRectanglesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (surface VkSurfaceKHR)
  (pRectCount (:pointer :uint32))
  (pRects (:pointer VkRect2D)))

(cffi:defcfun ("vkAcquireNextImage2KHR" vkAcquireNextImage2KHR) VkResult 
  (device VkDevice)
  (pAcquireInfo (:pointer VkAcquireNextImageInfoKHR))
  (pImageIndex (:pointer :uint32)))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPropertiesKHR" vkGetPhysicalDeviceDisplayPropertiesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkDisplayPropertiesKHR)))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPlanePropertiesKHR" vkGetPhysicalDeviceDisplayPlanePropertiesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkDisplayPlanePropertiesKHR)))

(cffi:defcfun ("vkGetDisplayPlaneSupportedDisplaysKHR" vkGetDisplayPlaneSupportedDisplaysKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (planeIndex :uint32)
  (pDisplayCount (:pointer :uint32))
  (pDisplays (:pointer VkDisplayKHR)))

(cffi:defcfun ("vkGetDisplayModePropertiesKHR" vkGetDisplayModePropertiesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (display VkDisplayKHR)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkDisplayModePropertiesKHR)))

(cffi:defcfun ("vkCreateDisplayModeKHR" vkCreateDisplayModeKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (display VkDisplayKHR)
  (pCreateInfo (:pointer VkDisplayModeCreateInfoKHR))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pMode (:pointer VkDisplayModeKHR)))

(cffi:defcfun ("vkGetDisplayPlaneCapabilitiesKHR" vkGetDisplayPlaneCapabilitiesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (mode VkDisplayModeKHR)
  (planeIndex :uint32)
  (pCapabilities (:pointer VkDisplayPlaneCapabilitiesKHR)))

(cffi:defcfun ("vkCreateDisplayPlaneSurfaceKHR" vkCreateDisplayPlaneSurfaceKHR) VkResult 
  (instance VkInstance)
  (pCreateInfo (:pointer VkDisplaySurfaceCreateInfoKHR))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSurface (:pointer VkSurfaceKHR)))

(cffi:defcfun ("vkCreateSharedSwapchainsKHR" vkCreateSharedSwapchainsKHR) VkResult 
  (device VkDevice)
  (swapchainCount :uint32)
  (pCreateInfos (:pointer VkSwapchainCreateInfoKHR))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSwapchains (:pointer VkSwapchainKHR)))

(cffi:defcfun ("vkCmdBeginRenderingKHR" vkCmdBeginRenderingKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pRenderingInfo (:pointer VkRenderingInfo)))

(cffi:defcfun ("vkCmdEndRenderingKHR" vkCmdEndRenderingKHR) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkGetPhysicalDeviceFeatures2KHR" vkGetPhysicalDeviceFeatures2KHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pFeatures (:pointer VkPhysicalDeviceFeatures2)))

(cffi:defcfun ("vkGetPhysicalDeviceProperties2KHR" vkGetPhysicalDeviceProperties2KHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pProperties (:pointer VkPhysicalDeviceProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceFormatProperties2KHR" vkGetPhysicalDeviceFormatProperties2KHR) :void 
  (physicalDevice VkPhysicalDevice)
  (format VkFormat)
  (pFormatProperties (:pointer VkFormatProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceImageFormatProperties2KHR" vkGetPhysicalDeviceImageFormatProperties2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pImageFormatInfo (:pointer VkPhysicalDeviceImageFormatInfo2))
  (pImageFormatProperties (:pointer VkImageFormatProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyProperties2KHR" vkGetPhysicalDeviceQueueFamilyProperties2KHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pQueueFamilyPropertyCount (:pointer :uint32))
  (pQueueFamilyProperties (:pointer VkQueueFamilyProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceMemoryProperties2KHR" vkGetPhysicalDeviceMemoryProperties2KHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pMemoryProperties (:pointer VkPhysicalDeviceMemoryProperties2)))

(cffi:defcfun ("vkGetPhysicalDeviceSparseImageFormatProperties2KHR" vkGetPhysicalDeviceSparseImageFormatProperties2KHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pFormatInfo (:pointer VkPhysicalDeviceSparseImageFormatInfo2))
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkSparseImageFormatProperties2)))

(cffi:defcfun ("vkGetDeviceGroupPeerMemoryFeaturesKHR" vkGetDeviceGroupPeerMemoryFeaturesKHR) :void 
  (device VkDevice)
  (heapIndex :uint32)
  (localDeviceIndex :uint32)
  (remoteDeviceIndex :uint32)
  (pPeerMemoryFeatures (:pointer VkPeerMemoryFeatureFlags)))

(cffi:defcfun ("vkCmdSetDeviceMaskKHR" vkCmdSetDeviceMaskKHR) :void 
  (commandBuffer VkCommandBuffer)
  (deviceMask :uint32))

(cffi:defcfun ("vkCmdDispatchBaseKHR" vkCmdDispatchBaseKHR) :void 
  (commandBuffer VkCommandBuffer)
  (baseGroupX :uint32)
  (baseGroupY :uint32)
  (baseGroupZ :uint32)
  (groupCountX :uint32)
  (groupCountY :uint32)
  (groupCountZ :uint32))

(cffi:defcfun ("vkTrimCommandPoolKHR" vkTrimCommandPoolKHR) :void 
  (device VkDevice)
  (commandPool VkCommandPool)
  (flags VkCommandPoolTrimFlags))

(cffi:defcfun ("vkEnumeratePhysicalDeviceGroupsKHR" vkEnumeratePhysicalDeviceGroupsKHR) VkResult 
  (instance VkInstance)
  (pPhysicalDeviceGroupCount (:pointer :uint32))
  (pPhysicalDeviceGroupProperties (:pointer VkPhysicalDeviceGroupProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalBufferPropertiesKHR" vkGetPhysicalDeviceExternalBufferPropertiesKHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pExternalBufferInfo (:pointer VkPhysicalDeviceExternalBufferInfo))
  (pExternalBufferProperties (:pointer VkExternalBufferProperties)))

(cffi:defcfun ("vkGetMemoryFdKHR" vkGetMemoryFdKHR) VkResult 
  (device VkDevice)
  (pGetFdInfo (:pointer VkMemoryGetFdInfoKHR))
  (pFd (:pointer :int)))

(cffi:defcfun ("vkGetMemoryFdPropertiesKHR" vkGetMemoryFdPropertiesKHR) VkResult 
  (device VkDevice)
  (handleType VkExternalMemoryHandleTypeFlagBits)
  (fd :int)
  (pMemoryFdProperties (:pointer VkMemoryFdPropertiesKHR)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalSemaphorePropertiesKHR" vkGetPhysicalDeviceExternalSemaphorePropertiesKHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pExternalSemaphoreInfo (:pointer VkPhysicalDeviceExternalSemaphoreInfo))
  (pExternalSemaphoreProperties (:pointer VkExternalSemaphoreProperties)))

(cffi:defcfun ("vkImportSemaphoreFdKHR" vkImportSemaphoreFdKHR) VkResult 
  (device VkDevice)
  (pImportSemaphoreFdInfo (:pointer VkImportSemaphoreFdInfoKHR)))

(cffi:defcfun ("vkGetSemaphoreFdKHR" vkGetSemaphoreFdKHR) VkResult 
  (device VkDevice)
  (pGetFdInfo (:pointer VkSemaphoreGetFdInfoKHR))
  (pFd (:pointer :int)))

(cffi:defcfun ("vkCmdPushDescriptorSetKHR" vkCmdPushDescriptorSetKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineBindPoint VkPipelineBindPoint)
  (layout VkPipelineLayout)
  (set :uint32)
  (descriptorWriteCount :uint32)
  (pDescriptorWrites (:pointer VkWriteDescriptorSet)))

(cffi:defcfun ("vkCmdPushDescriptorSetWithTemplateKHR" vkCmdPushDescriptorSetWithTemplateKHR) :void 
  (commandBuffer VkCommandBuffer)
  (descriptorUpdateTemplate VkDescriptorUpdateTemplate)
  (layout VkPipelineLayout)
  (set :uint32)
  (pData (:pointer :void)))

(cffi:defcfun ("vkCreateDescriptorUpdateTemplateKHR" vkCreateDescriptorUpdateTemplateKHR) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkDescriptorUpdateTemplateCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pDescriptorUpdateTemplate (:pointer VkDescriptorUpdateTemplate)))

(cffi:defcfun ("vkDestroyDescriptorUpdateTemplateKHR" vkDestroyDescriptorUpdateTemplateKHR) :void 
  (device VkDevice)
  (descriptorUpdateTemplate VkDescriptorUpdateTemplate)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkUpdateDescriptorSetWithTemplateKHR" vkUpdateDescriptorSetWithTemplateKHR) :void 
  (device VkDevice)
  (descriptorSet VkDescriptorSet)
  (descriptorUpdateTemplate VkDescriptorUpdateTemplate)
  (pData (:pointer :void)))

(cffi:defcfun ("vkCreateRenderPass2KHR" vkCreateRenderPass2KHR) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkRenderPassCreateInfo2))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pRenderPass (:pointer VkRenderPass)))

(cffi:defcfun ("vkCmdBeginRenderPass2KHR" vkCmdBeginRenderPass2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pRenderPassBegin (:pointer VkRenderPassBeginInfo))
  (pSubpassBeginInfo (:pointer VkSubpassBeginInfo)))

(cffi:defcfun ("vkCmdNextSubpass2KHR" vkCmdNextSubpass2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pSubpassBeginInfo (:pointer VkSubpassBeginInfo))
  (pSubpassEndInfo (:pointer VkSubpassEndInfo)))

(cffi:defcfun ("vkCmdEndRenderPass2KHR" vkCmdEndRenderPass2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pSubpassEndInfo (:pointer VkSubpassEndInfo)))

(cffi:defcfun ("vkGetSwapchainStatusKHR" vkGetSwapchainStatusKHR) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR))

(cffi:defcfun ("vkGetPhysicalDeviceExternalFencePropertiesKHR" vkGetPhysicalDeviceExternalFencePropertiesKHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pExternalFenceInfo (:pointer VkPhysicalDeviceExternalFenceInfo))
  (pExternalFenceProperties (:pointer VkExternalFenceProperties)))

(cffi:defcfun ("vkImportFenceFdKHR" vkImportFenceFdKHR) VkResult 
  (device VkDevice)
  (pImportFenceFdInfo (:pointer VkImportFenceFdInfoKHR)))

(cffi:defcfun ("vkGetFenceFdKHR" vkGetFenceFdKHR) VkResult 
  (device VkDevice)
  (pGetFdInfo (:pointer VkFenceGetFdInfoKHR))
  (pFd (:pointer :int)))

(cffi:defcfun ("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR" vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (queueFamilyIndex :uint32)
  (pCounterCount (:pointer :uint32))
  (pCounters (:pointer VkPerformanceCounterKHR))
  (pCounterDescriptions (:pointer VkPerformanceCounterDescriptionKHR)))

(cffi:defcfun ("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR" vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR) :void 
  (physicalDevice VkPhysicalDevice)
  (pPerformanceQueryCreateInfo (:pointer VkQueryPoolPerformanceCreateInfoKHR))
  (pNumPasses (:pointer :uint32)))

(cffi:defcfun ("vkAcquireProfilingLockKHR" vkAcquireProfilingLockKHR) VkResult 
  (device VkDevice)
  (pInfo (:pointer VkAcquireProfilingLockInfoKHR)))

(cffi:defcfun ("vkReleaseProfilingLockKHR" vkReleaseProfilingLockKHR) :void 
  (device VkDevice))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2KHR" vkGetPhysicalDeviceSurfaceCapabilities2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pSurfaceInfo (:pointer VkPhysicalDeviceSurfaceInfo2KHR))
  (pSurfaceCapabilities (:pointer VkSurfaceCapabilities2KHR)))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceFormats2KHR" vkGetPhysicalDeviceSurfaceFormats2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pSurfaceInfo (:pointer VkPhysicalDeviceSurfaceInfo2KHR))
  (pSurfaceFormatCount (:pointer :uint32))
  (pSurfaceFormats (:pointer VkSurfaceFormat2KHR)))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayProperties2KHR" vkGetPhysicalDeviceDisplayProperties2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkDisplayProperties2KHR)))

(cffi:defcfun ("vkGetPhysicalDeviceDisplayPlaneProperties2KHR" vkGetPhysicalDeviceDisplayPlaneProperties2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkDisplayPlaneProperties2KHR)))

(cffi:defcfun ("vkGetDisplayModeProperties2KHR" vkGetDisplayModeProperties2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (display VkDisplayKHR)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkDisplayModeProperties2KHR)))

(cffi:defcfun ("vkGetDisplayPlaneCapabilities2KHR" vkGetDisplayPlaneCapabilities2KHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pDisplayPlaneInfo (:pointer VkDisplayPlaneInfo2KHR))
  (pCapabilities (:pointer VkDisplayPlaneCapabilities2KHR)))

(cffi:defcfun ("vkGetImageMemoryRequirements2KHR" vkGetImageMemoryRequirements2KHR) :void 
  (device VkDevice)
  (pInfo (:pointer VkImageMemoryRequirementsInfo2))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetBufferMemoryRequirements2KHR" vkGetBufferMemoryRequirements2KHR) :void 
  (device VkDevice)
  (pInfo (:pointer VkBufferMemoryRequirementsInfo2))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetImageSparseMemoryRequirements2KHR" vkGetImageSparseMemoryRequirements2KHR) :void 
  (device VkDevice)
  (pInfo (:pointer VkImageSparseMemoryRequirementsInfo2))
  (pSparseMemoryRequirementCount (:pointer :uint32))
  (pSparseMemoryRequirements (:pointer VkSparseImageMemoryRequirements2)))

(cffi:defcfun ("vkCreateSamplerYcbcrConversionKHR" vkCreateSamplerYcbcrConversionKHR) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkSamplerYcbcrConversionCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pYcbcrConversion (:pointer VkSamplerYcbcrConversion)))

(cffi:defcfun ("vkDestroySamplerYcbcrConversionKHR" vkDestroySamplerYcbcrConversionKHR) :void 
  (device VkDevice)
  (ycbcrConversion VkSamplerYcbcrConversion)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkBindBufferMemory2KHR" vkBindBufferMemory2KHR) VkResult 
  (device VkDevice)
  (bindInfoCount :uint32)
  (pBindInfos (:pointer VkBindBufferMemoryInfo)))

(cffi:defcfun ("vkBindImageMemory2KHR" vkBindImageMemory2KHR) VkResult 
  (device VkDevice)
  (bindInfoCount :uint32)
  (pBindInfos (:pointer VkBindImageMemoryInfo)))

(cffi:defcfun ("vkGetDescriptorSetLayoutSupportKHR" vkGetDescriptorSetLayoutSupportKHR) :void 
  (device VkDevice)
  (pCreateInfo (:pointer VkDescriptorSetLayoutCreateInfo))
  (pSupport (:pointer VkDescriptorSetLayoutSupport)))

(cffi:defcfun ("vkCmdDrawIndirectCountKHR" vkCmdDrawIndirectCountKHR) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirectCountKHR" vkCmdDrawIndexedIndirectCountKHR) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkGetSemaphoreCounterValueKHR" vkGetSemaphoreCounterValueKHR) VkResult 
  (device VkDevice)
  (semaphore VkSemaphore)
  (pValue (:pointer :uint64)))

(cffi:defcfun ("vkWaitSemaphoresKHR" vkWaitSemaphoresKHR) VkResult 
  (device VkDevice)
  (pWaitInfo (:pointer VkSemaphoreWaitInfo))
  (timeout :uint64))

(cffi:defcfun ("vkSignalSemaphoreKHR" vkSignalSemaphoreKHR) VkResult 
  (device VkDevice)
  (pSignalInfo (:pointer VkSemaphoreSignalInfo)))

(cffi:defcfun ("vkGetPhysicalDeviceFragmentShadingRatesKHR" vkGetPhysicalDeviceFragmentShadingRatesKHR) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pFragmentShadingRateCount (:pointer :uint32))
  (pFragmentShadingRates (:pointer VkPhysicalDeviceFragmentShadingRateKHR)))

(cffi:defcfun ("vkCmdSetFragmentShadingRateKHR" vkCmdSetFragmentShadingRateKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pFragmentSize (:pointer VkExtent2D))
  (combinerOps[2] VkFragmentShadingRateCombinerOpKHR))

(cffi:defcfun ("vkWaitForPresentKHR" vkWaitForPresentKHR) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (presentId :uint64)
  (timeout :uint64))

(cffi:defcfun ("vkGetBufferDeviceAddressKHR" vkGetBufferDeviceAddressKHR) VkDeviceAddress 
  (device VkDevice)
  (pInfo (:pointer VkBufferDeviceAddressInfo)))

(cffi:defcfun ("vkGetBufferOpaqueCaptureAddressKHR" vkGetBufferOpaqueCaptureAddressKHR) :uint64 
  (device VkDevice)
  (pInfo (:pointer VkBufferDeviceAddressInfo)))

(cffi:defcfun ("vkGetDeviceMemoryOpaqueCaptureAddressKHR" vkGetDeviceMemoryOpaqueCaptureAddressKHR) :uint64 
  (device VkDevice)
  (pInfo (:pointer VkDeviceMemoryOpaqueCaptureAddressInfo)))

(cffi:defcfun ("vkCreateDeferredOperationKHR" vkCreateDeferredOperationKHR) VkResult 
  (device VkDevice)
  (pAllocator (:pointer VkAllocationCallbacks))
  (pDeferredOperation (:pointer VkDeferredOperationKHR)))

(cffi:defcfun ("vkDestroyDeferredOperationKHR" vkDestroyDeferredOperationKHR) :void 
  (device VkDevice)
  (operation VkDeferredOperationKHR)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetDeferredOperationMaxConcurrencyKHR" vkGetDeferredOperationMaxConcurrencyKHR) :uint32 
  (device VkDevice)
  (operation VkDeferredOperationKHR))

(cffi:defcfun ("vkGetDeferredOperationResultKHR" vkGetDeferredOperationResultKHR) VkResult 
  (device VkDevice)
  (operation VkDeferredOperationKHR))

(cffi:defcfun ("vkDeferredOperationJoinKHR" vkDeferredOperationJoinKHR) VkResult 
  (device VkDevice)
  (operation VkDeferredOperationKHR))

(cffi:defcfun ("vkGetPipelineExecutablePropertiesKHR" vkGetPipelineExecutablePropertiesKHR) VkResult 
  (device VkDevice)
  (pPipelineInfo (:pointer VkPipelineInfoKHR))
  (pExecutableCount (:pointer :uint32))
  (pProperties (:pointer VkPipelineExecutablePropertiesKHR)))

(cffi:defcfun ("vkGetPipelineExecutableStatisticsKHR" vkGetPipelineExecutableStatisticsKHR) VkResult 
  (device VkDevice)
  (pExecutableInfo (:pointer VkPipelineExecutableInfoKHR))
  (pStatisticCount (:pointer :uint32))
  (pStatistics (:pointer VkPipelineExecutableStatisticKHR)))

(cffi:defcfun ("vkGetPipelineExecutableInternalRepresentationsKHR" vkGetPipelineExecutableInternalRepresentationsKHR) VkResult 
  (device VkDevice)
  (pExecutableInfo (:pointer VkPipelineExecutableInfoKHR))
  (pInternalRepresentationCount (:pointer :uint32))
  (pInternalRepresentations (:pointer VkPipelineExecutableInternalRepresentationKHR)))

(cffi:defcfun ("vkCmdSetEvent2KHR" vkCmdSetEvent2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (event VkEvent)
  (pDependencyInfo (:pointer VkDependencyInfo)))

(cffi:defcfun ("vkCmdResetEvent2KHR" vkCmdResetEvent2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (event VkEvent)
  (stageMask VkPipelineStageFlags2))

(cffi:defcfun ("vkCmdWaitEvents2KHR" vkCmdWaitEvents2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (eventCount :uint32)
  (pEvents (:pointer VkEvent))
  (pDependencyInfos (:pointer VkDependencyInfo)))

(cffi:defcfun ("vkCmdPipelineBarrier2KHR" vkCmdPipelineBarrier2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pDependencyInfo (:pointer VkDependencyInfo)))

(cffi:defcfun ("vkCmdWriteTimestamp2KHR" vkCmdWriteTimestamp2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (stage VkPipelineStageFlags2)
  (queryPool VkQueryPool)
  (query :uint32))

(cffi:defcfun ("vkQueueSubmit2KHR" vkQueueSubmit2KHR) VkResult 
  (queue VkQueue)
  (submitCount :uint32)
  (pSubmits (:pointer VkSubmitInfo2))
  (fence VkFence))

(cffi:defcfun ("vkCmdWriteBufferMarker2AMD" vkCmdWriteBufferMarker2AMD) :void 
  (commandBuffer VkCommandBuffer)
  (stage VkPipelineStageFlags2)
  (dstBuffer VkBuffer)
  (dstOffset VkDeviceSize)
  (marker :uint32))

(cffi:defcfun ("vkGetQueueCheckpointData2NV" vkGetQueueCheckpointData2NV) :void 
  (queue VkQueue)
  (pCheckpointDataCount (:pointer :uint32))
  (pCheckpointData (:pointer VkCheckpointData2NV)))

(cffi:defcfun ("vkCmdCopyBuffer2KHR" vkCmdCopyBuffer2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyBufferInfo (:pointer VkCopyBufferInfo2)))

(cffi:defcfun ("vkCmdCopyImage2KHR" vkCmdCopyImage2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyImageInfo (:pointer VkCopyImageInfo2)))

(cffi:defcfun ("vkCmdCopyBufferToImage2KHR" vkCmdCopyBufferToImage2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyBufferToImageInfo (:pointer VkCopyBufferToImageInfo2)))

(cffi:defcfun ("vkCmdCopyImageToBuffer2KHR" vkCmdCopyImageToBuffer2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pCopyImageToBufferInfo (:pointer VkCopyImageToBufferInfo2)))

(cffi:defcfun ("vkCmdBlitImage2KHR" vkCmdBlitImage2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pBlitImageInfo (:pointer VkBlitImageInfo2)))

(cffi:defcfun ("vkCmdResolveImage2KHR" vkCmdResolveImage2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (pResolveImageInfo (:pointer VkResolveImageInfo2)))

(cffi:defcfun ("vkCmdTraceRaysIndirect2KHR" vkCmdTraceRaysIndirect2KHR) :void 
  (commandBuffer VkCommandBuffer)
  (indirectDeviceAddress VkDeviceAddress))

(cffi:defcfun ("vkGetDeviceBufferMemoryRequirementsKHR" vkGetDeviceBufferMemoryRequirementsKHR) :void 
  (device VkDevice)
  (pInfo (:pointer VkDeviceBufferMemoryRequirements))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetDeviceImageMemoryRequirementsKHR" vkGetDeviceImageMemoryRequirementsKHR) :void 
  (device VkDevice)
  (pInfo (:pointer VkDeviceImageMemoryRequirements))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkGetDeviceImageSparseMemoryRequirementsKHR" vkGetDeviceImageSparseMemoryRequirementsKHR) :void 
  (device VkDevice)
  (pInfo (:pointer VkDeviceImageMemoryRequirements))
  (pSparseMemoryRequirementCount (:pointer :uint32))
  (pSparseMemoryRequirements (:pointer VkSparseImageMemoryRequirements2)))

(cffi:defcfun ("vkCreateDebugReportCallbackEXT" vkCreateDebugReportCallbackEXT) VkResult 
  (instance VkInstance)
  (pCreateInfo (:pointer VkDebugReportCallbackCreateInfoEXT))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pCallback (:pointer VkDebugReportCallbackEXT)))

(cffi:defcfun ("vkDestroyDebugReportCallbackEXT" vkDestroyDebugReportCallbackEXT) :void 
  (instance VkInstance)
  (callback VkDebugReportCallbackEXT)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkDebugReportMessageEXT" vkDebugReportMessageEXT) :void 
  (instance VkInstance)
  (flags VkDebugReportFlagsEXT)
  (objectType VkDebugReportObjectTypeEXT)
  (object :uint64)
  (location :size)
  (messageCode :int32)
  (pLayerPrefix (:pointer :char))
  (pMessage (:pointer :char)))

(cffi:defcfun ("vkDebugMarkerSetObjectTagEXT" vkDebugMarkerSetObjectTagEXT) VkResult 
  (device VkDevice)
  (pTagInfo (:pointer VkDebugMarkerObjectTagInfoEXT)))

(cffi:defcfun ("vkDebugMarkerSetObjectNameEXT" vkDebugMarkerSetObjectNameEXT) VkResult 
  (device VkDevice)
  (pNameInfo (:pointer VkDebugMarkerObjectNameInfoEXT)))

(cffi:defcfun ("vkCmdDebugMarkerBeginEXT" vkCmdDebugMarkerBeginEXT) :void 
  (commandBuffer VkCommandBuffer)
  (pMarkerInfo (:pointer VkDebugMarkerMarkerInfoEXT)))

(cffi:defcfun ("vkCmdDebugMarkerEndEXT" vkCmdDebugMarkerEndEXT) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkCmdDebugMarkerInsertEXT" vkCmdDebugMarkerInsertEXT) :void 
  (commandBuffer VkCommandBuffer)
  (pMarkerInfo (:pointer VkDebugMarkerMarkerInfoEXT)))

(cffi:defcfun ("vkCmdBindTransformFeedbackBuffersEXT" vkCmdBindTransformFeedbackBuffersEXT) :void 
  (commandBuffer VkCommandBuffer)
  (firstBinding :uint32)
  (bindingCount :uint32)
  (pBuffers (:pointer VkBuffer))
  (pOffsets (:pointer VkDeviceSize))
  (pSizes (:pointer VkDeviceSize)))

(cffi:defcfun ("vkCmdBeginTransformFeedbackEXT" vkCmdBeginTransformFeedbackEXT) :void 
  (commandBuffer VkCommandBuffer)
  (firstCounterBuffer :uint32)
  (counterBufferCount :uint32)
  (pCounterBuffers (:pointer VkBuffer))
  (pCounterBufferOffsets (:pointer VkDeviceSize)))

(cffi:defcfun ("vkCmdEndTransformFeedbackEXT" vkCmdEndTransformFeedbackEXT) :void 
  (commandBuffer VkCommandBuffer)
  (firstCounterBuffer :uint32)
  (counterBufferCount :uint32)
  (pCounterBuffers (:pointer VkBuffer))
  (pCounterBufferOffsets (:pointer VkDeviceSize)))

(cffi:defcfun ("vkCmdBeginQueryIndexedEXT" vkCmdBeginQueryIndexedEXT) :void 
  (commandBuffer VkCommandBuffer)
  (queryPool VkQueryPool)
  (query :uint32)
  (flags VkQueryControlFlags)
  (index :uint32))

(cffi:defcfun ("vkCmdEndQueryIndexedEXT" vkCmdEndQueryIndexedEXT) :void 
  (commandBuffer VkCommandBuffer)
  (queryPool VkQueryPool)
  (query :uint32)
  (index :uint32))

(cffi:defcfun ("vkCmdDrawIndirectByteCountEXT" vkCmdDrawIndirectByteCountEXT) :void 
  (commandBuffer VkCommandBuffer)
  (instanceCount :uint32)
  (firstInstance :uint32)
  (counterBuffer VkBuffer)
  (counterBufferOffset VkDeviceSize)
  (counterOffset :uint32)
  (vertexStride :uint32))

(cffi:defcfun ("vkCreateCuModuleNVX" vkCreateCuModuleNVX) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkCuModuleCreateInfoNVX))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pModule (:pointer VkCuModuleNVX)))

(cffi:defcfun ("vkCreateCuFunctionNVX" vkCreateCuFunctionNVX) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkCuFunctionCreateInfoNVX))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pFunction (:pointer VkCuFunctionNVX)))

(cffi:defcfun ("vkDestroyCuModuleNVX" vkDestroyCuModuleNVX) :void 
  (device VkDevice)
  (module VkCuModuleNVX)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkDestroyCuFunctionNVX" vkDestroyCuFunctionNVX) :void 
  (device VkDevice)
  (function VkCuFunctionNVX)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCmdCuLaunchKernelNVX" vkCmdCuLaunchKernelNVX) :void 
  (commandBuffer VkCommandBuffer)
  (pLaunchInfo (:pointer VkCuLaunchInfoNVX)))

(cffi:defcfun ("vkGetImageViewHandleNVX" vkGetImageViewHandleNVX) :uint32 
  (device VkDevice)
  (pInfo (:pointer VkImageViewHandleInfoNVX)))

(cffi:defcfun ("vkGetImageViewAddressNVX" vkGetImageViewAddressNVX) VkResult 
  (device VkDevice)
  (imageView VkImageView)
  (pProperties (:pointer VkImageViewAddressPropertiesNVX)))

(cffi:defcfun ("vkCmdDrawIndirectCountAMD" vkCmdDrawIndirectCountAMD) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawIndexedIndirectCountAMD" vkCmdDrawIndexedIndirectCountAMD) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkGetShaderInfoAMD" vkGetShaderInfoAMD) VkResult 
  (device VkDevice)
  (pipeline VkPipeline)
  (shaderStage VkShaderStageFlagBits)
  (infoType VkShaderInfoTypeAMD)
  (pInfoSize (:pointer :size))
  (pInfo (:pointer :void)))

(cffi:defcfun ("vkGetPhysicalDeviceExternalImageFormatPropertiesNV" vkGetPhysicalDeviceExternalImageFormatPropertiesNV) VkResult 
  (physicalDevice VkPhysicalDevice)
  (format VkFormat)
  (type VkImageType)
  (tiling VkImageTiling)
  (usage VkImageUsageFlags)
  (flags VkImageCreateFlags)
  (externalHandleType VkExternalMemoryHandleTypeFlagsNV)
  (pExternalImageFormatProperties (:pointer VkExternalImageFormatPropertiesNV)))

(cffi:defcfun ("vkCmdBeginConditionalRenderingEXT" vkCmdBeginConditionalRenderingEXT) :void 
  (commandBuffer VkCommandBuffer)
  (pConditionalRenderingBegin (:pointer VkConditionalRenderingBeginInfoEXT)))

(cffi:defcfun ("vkCmdEndConditionalRenderingEXT" vkCmdEndConditionalRenderingEXT) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkCmdSetViewportWScalingNV" vkCmdSetViewportWScalingNV) :void 
  (commandBuffer VkCommandBuffer)
  (firstViewport :uint32)
  (viewportCount :uint32)
  (pViewportWScalings (:pointer VkViewportWScalingNV)))

(cffi:defcfun ("vkReleaseDisplayEXT" vkReleaseDisplayEXT) VkResult 
  (physicalDevice VkPhysicalDevice)
  (display VkDisplayKHR))

(cffi:defcfun ("vkGetPhysicalDeviceSurfaceCapabilities2EXT" vkGetPhysicalDeviceSurfaceCapabilities2EXT) VkResult 
  (physicalDevice VkPhysicalDevice)
  (surface VkSurfaceKHR)
  (pSurfaceCapabilities (:pointer VkSurfaceCapabilities2EXT)))

(cffi:defcfun ("vkDisplayPowerControlEXT" vkDisplayPowerControlEXT) VkResult 
  (device VkDevice)
  (display VkDisplayKHR)
  (pDisplayPowerInfo (:pointer VkDisplayPowerInfoEXT)))

(cffi:defcfun ("vkRegisterDeviceEventEXT" vkRegisterDeviceEventEXT) VkResult 
  (device VkDevice)
  (pDeviceEventInfo (:pointer VkDeviceEventInfoEXT))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pFence (:pointer VkFence)))

(cffi:defcfun ("vkRegisterDisplayEventEXT" vkRegisterDisplayEventEXT) VkResult 
  (device VkDevice)
  (display VkDisplayKHR)
  (pDisplayEventInfo (:pointer VkDisplayEventInfoEXT))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pFence (:pointer VkFence)))

(cffi:defcfun ("vkGetSwapchainCounterEXT" vkGetSwapchainCounterEXT) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (counter VkSurfaceCounterFlagBitsEXT)
  (pCounterValue (:pointer :uint64)))

(cffi:defcfun ("vkGetRefreshCycleDurationGOOGLE" vkGetRefreshCycleDurationGOOGLE) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (pDisplayTimingProperties (:pointer VkRefreshCycleDurationGOOGLE)))

(cffi:defcfun ("vkGetPastPresentationTimingGOOGLE" vkGetPastPresentationTimingGOOGLE) VkResult 
  (device VkDevice)
  (swapchain VkSwapchainKHR)
  (pPresentationTimingCount (:pointer :uint32))
  (pPresentationTimings (:pointer VkPastPresentationTimingGOOGLE)))

(cffi:defcfun ("vkCmdSetDiscardRectangleEXT" vkCmdSetDiscardRectangleEXT) :void 
  (commandBuffer VkCommandBuffer)
  (firstDiscardRectangle :uint32)
  (discardRectangleCount :uint32)
  (pDiscardRectangles (:pointer VkRect2D)))

(cffi:defcfun ("vkSetHdrMetadataEXT" vkSetHdrMetadataEXT) :void 
  (device VkDevice)
  (swapchainCount :uint32)
  (pSwapchains (:pointer VkSwapchainKHR))
  (pMetadata (:pointer VkHdrMetadataEXT)))

(cffi:defcfun ("vkSetDebugUtilsObjectNameEXT" vkSetDebugUtilsObjectNameEXT) VkResult 
  (device VkDevice)
  (pNameInfo (:pointer VkDebugUtilsObjectNameInfoEXT)))

(cffi:defcfun ("vkSetDebugUtilsObjectTagEXT" vkSetDebugUtilsObjectTagEXT) VkResult 
  (device VkDevice)
  (pTagInfo (:pointer VkDebugUtilsObjectTagInfoEXT)))

(cffi:defcfun ("vkQueueBeginDebugUtilsLabelEXT" vkQueueBeginDebugUtilsLabelEXT) :void 
  (queue VkQueue)
  (pLabelInfo (:pointer VkDebugUtilsLabelEXT)))

(cffi:defcfun ("vkQueueEndDebugUtilsLabelEXT" vkQueueEndDebugUtilsLabelEXT) :void 
  (queue VkQueue))

(cffi:defcfun ("vkQueueInsertDebugUtilsLabelEXT" vkQueueInsertDebugUtilsLabelEXT) :void 
  (queue VkQueue)
  (pLabelInfo (:pointer VkDebugUtilsLabelEXT)))

(cffi:defcfun ("vkCmdBeginDebugUtilsLabelEXT" vkCmdBeginDebugUtilsLabelEXT) :void 
  (commandBuffer VkCommandBuffer)
  (pLabelInfo (:pointer VkDebugUtilsLabelEXT)))

(cffi:defcfun ("vkCmdEndDebugUtilsLabelEXT" vkCmdEndDebugUtilsLabelEXT) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkCmdInsertDebugUtilsLabelEXT" vkCmdInsertDebugUtilsLabelEXT) :void 
  (commandBuffer VkCommandBuffer)
  (pLabelInfo (:pointer VkDebugUtilsLabelEXT)))

(cffi:defcfun ("vkCreateDebugUtilsMessengerEXT" vkCreateDebugUtilsMessengerEXT) VkResult 
  (instance VkInstance)
  (pCreateInfo (:pointer VkDebugUtilsMessengerCreateInfoEXT))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pMessenger (:pointer VkDebugUtilsMessengerEXT)))

(cffi:defcfun ("vkDestroyDebugUtilsMessengerEXT" vkDestroyDebugUtilsMessengerEXT) :void 
  (instance VkInstance)
  (messenger VkDebugUtilsMessengerEXT)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkSubmitDebugUtilsMessageEXT" vkSubmitDebugUtilsMessageEXT) :void 
  (instance VkInstance)
  (messageSeverity VkDebugUtilsMessageSeverityFlagBitsEXT)
  (messageTypes VkDebugUtilsMessageTypeFlagsEXT)
  (pCallbackData (:pointer VkDebugUtilsMessengerCallbackDataEXT)))

(cffi:defcfun ("vkCmdSetSampleLocationsEXT" vkCmdSetSampleLocationsEXT) :void 
  (commandBuffer VkCommandBuffer)
  (pSampleLocationsInfo (:pointer VkSampleLocationsInfoEXT)))

(cffi:defcfun ("vkGetPhysicalDeviceMultisamplePropertiesEXT" vkGetPhysicalDeviceMultisamplePropertiesEXT) :void 
  (physicalDevice VkPhysicalDevice)
  (samples VkSampleCountFlagBits)
  (pMultisampleProperties (:pointer VkMultisamplePropertiesEXT)))

(cffi:defcfun ("vkGetImageDrmFormatModifierPropertiesEXT" vkGetImageDrmFormatModifierPropertiesEXT) VkResult 
  (device VkDevice)
  (image VkImage)
  (pProperties (:pointer VkImageDrmFormatModifierPropertiesEXT)))

(cffi:defcfun ("vkCreateValidationCacheEXT" vkCreateValidationCacheEXT) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkValidationCacheCreateInfoEXT))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pValidationCache (:pointer VkValidationCacheEXT)))

(cffi:defcfun ("vkDestroyValidationCacheEXT" vkDestroyValidationCacheEXT) :void 
  (device VkDevice)
  (validationCache VkValidationCacheEXT)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkMergeValidationCachesEXT" vkMergeValidationCachesEXT) VkResult 
  (device VkDevice)
  (dstCache VkValidationCacheEXT)
  (srcCacheCount :uint32)
  (pSrcCaches (:pointer VkValidationCacheEXT)))

(cffi:defcfun ("vkGetValidationCacheDataEXT" vkGetValidationCacheDataEXT) VkResult 
  (device VkDevice)
  (validationCache VkValidationCacheEXT)
  (pDataSize (:pointer :size))
  (pData (:pointer :void)))

(cffi:defcfun ("vkCmdBindShadingRateImageNV" vkCmdBindShadingRateImageNV) :void 
  (commandBuffer VkCommandBuffer)
  (imageView VkImageView)
  (imageLayout VkImageLayout))

(cffi:defcfun ("vkCmdSetViewportShadingRatePaletteNV" vkCmdSetViewportShadingRatePaletteNV) :void 
  (commandBuffer VkCommandBuffer)
  (firstViewport :uint32)
  (viewportCount :uint32)
  (pShadingRatePalettes (:pointer VkShadingRatePaletteNV)))

(cffi:defcfun ("vkCmdSetCoarseSampleOrderNV" vkCmdSetCoarseSampleOrderNV) :void 
  (commandBuffer VkCommandBuffer)
  (sampleOrderType VkCoarseSampleOrderTypeNV)
  (customSampleOrderCount :uint32)
  (pCustomSampleOrders (:pointer VkCoarseSampleOrderCustomNV)))

(cffi:defcfun ("vkCreateAccelerationStructureNV" vkCreateAccelerationStructureNV) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkAccelerationStructureCreateInfoNV))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pAccelerationStructure (:pointer VkAccelerationStructureNV)))

(cffi:defcfun ("vkDestroyAccelerationStructureNV" vkDestroyAccelerationStructureNV) :void 
  (device VkDevice)
  (accelerationStructure VkAccelerationStructureNV)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkGetAccelerationStructureMemoryRequirementsNV" vkGetAccelerationStructureMemoryRequirementsNV) :void 
  (device VkDevice)
  (pInfo (:pointer VkAccelerationStructureMemoryRequirementsInfoNV))
  (pMemoryRequirements (:pointer VkMemoryRequirements2KHR)))

(cffi:defcfun ("vkBindAccelerationStructureMemoryNV" vkBindAccelerationStructureMemoryNV) VkResult 
  (device VkDevice)
  (bindInfoCount :uint32)
  (pBindInfos (:pointer VkBindAccelerationStructureMemoryInfoNV)))

(cffi:defcfun ("vkCmdBuildAccelerationStructureNV" vkCmdBuildAccelerationStructureNV) :void 
  (commandBuffer VkCommandBuffer)
  (pInfo (:pointer VkAccelerationStructureInfoNV))
  (instanceData VkBuffer)
  (instanceOffset VkDeviceSize)
  (update VkBool32)
  (dst VkAccelerationStructureNV)
  (src VkAccelerationStructureNV)
  (scratch VkBuffer)
  (scratchOffset VkDeviceSize))

(cffi:defcfun ("vkCmdCopyAccelerationStructureNV" vkCmdCopyAccelerationStructureNV) :void 
  (commandBuffer VkCommandBuffer)
  (dst VkAccelerationStructureNV)
  (src VkAccelerationStructureNV)
  (mode VkCopyAccelerationStructureModeKHR))

(cffi:defcfun ("vkCmdTraceRaysNV" vkCmdTraceRaysNV) :void 
  (commandBuffer VkCommandBuffer)
  (raygenShaderBindingTableBuffer VkBuffer)
  (raygenShaderBindingOffset VkDeviceSize)
  (missShaderBindingTableBuffer VkBuffer)
  (missShaderBindingOffset VkDeviceSize)
  (missShaderBindingStride VkDeviceSize)
  (hitShaderBindingTableBuffer VkBuffer)
  (hitShaderBindingOffset VkDeviceSize)
  (hitShaderBindingStride VkDeviceSize)
  (callableShaderBindingTableBuffer VkBuffer)
  (callableShaderBindingOffset VkDeviceSize)
  (callableShaderBindingStride VkDeviceSize)
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcfun ("vkCreateRayTracingPipelinesNV" vkCreateRayTracingPipelinesNV) VkResult 
  (device VkDevice)
  (pipelineCache VkPipelineCache)
  (createInfoCount :uint32)
  (pCreateInfos (:pointer VkRayTracingPipelineCreateInfoNV))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPipelines (:pointer VkPipeline)))

(cffi:defcfun ("vkGetRayTracingShaderGroupHandlesKHR" vkGetRayTracingShaderGroupHandlesKHR) VkResult 
  (device VkDevice)
  (pipeline VkPipeline)
  (firstGroup :uint32)
  (groupCount :uint32)
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcfun ("vkGetRayTracingShaderGroupHandlesNV" vkGetRayTracingShaderGroupHandlesNV) VkResult 
  (device VkDevice)
  (pipeline VkPipeline)
  (firstGroup :uint32)
  (groupCount :uint32)
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcfun ("vkGetAccelerationStructureHandleNV" vkGetAccelerationStructureHandleNV) VkResult 
  (device VkDevice)
  (accelerationStructure VkAccelerationStructureNV)
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesNV" vkCmdWriteAccelerationStructuresPropertiesNV) :void 
  (commandBuffer VkCommandBuffer)
  (accelerationStructureCount :uint32)
  (pAccelerationStructures (:pointer VkAccelerationStructureNV))
  (queryType VkQueryType)
  (queryPool VkQueryPool)
  (firstQuery :uint32))

(cffi:defcfun ("vkCompileDeferredNV" vkCompileDeferredNV) VkResult 
  (device VkDevice)
  (pipeline VkPipeline)
  (shader :uint32))

(cffi:defcfun ("vkGetMemoryHostPointerPropertiesEXT" vkGetMemoryHostPointerPropertiesEXT) VkResult 
  (device VkDevice)
  (handleType VkExternalMemoryHandleTypeFlagBits)
  (pHostPointer (:pointer :void))
  (pMemoryHostPointerProperties (:pointer VkMemoryHostPointerPropertiesEXT)))

(cffi:defcfun ("vkCmdWriteBufferMarkerAMD" vkCmdWriteBufferMarkerAMD) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineStage VkPipelineStageFlagBits)
  (dstBuffer VkBuffer)
  (dstOffset VkDeviceSize)
  (marker :uint32))

(cffi:defcfun ("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT" vkGetPhysicalDeviceCalibrateableTimeDomainsEXT) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pTimeDomainCount (:pointer :uint32))
  (pTimeDomains (:pointer VkTimeDomainEXT)))

(cffi:defcfun ("vkGetCalibratedTimestampsEXT" vkGetCalibratedTimestampsEXT) VkResult 
  (device VkDevice)
  (timestampCount :uint32)
  (pTimestampInfos (:pointer VkCalibratedTimestampInfoEXT))
  (pTimestamps (:pointer :uint64))
  (pMaxDeviation (:pointer :uint64)))

(cffi:defcfun ("vkCmdDrawMeshTasksNV" vkCmdDrawMeshTasksNV) :void 
  (commandBuffer VkCommandBuffer)
  (taskCount :uint32)
  (firstTask :uint32))

(cffi:defcfun ("vkCmdDrawMeshTasksIndirectNV" vkCmdDrawMeshTasksIndirectNV) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (drawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawMeshTasksIndirectCountNV" vkCmdDrawMeshTasksIndirectCountNV) :void 
  (commandBuffer VkCommandBuffer)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (countBuffer VkBuffer)
  (countBufferOffset VkDeviceSize)
  (maxDrawCount :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdSetExclusiveScissorNV" vkCmdSetExclusiveScissorNV) :void 
  (commandBuffer VkCommandBuffer)
  (firstExclusiveScissor :uint32)
  (exclusiveScissorCount :uint32)
  (pExclusiveScissors (:pointer VkRect2D)))

(cffi:defcfun ("vkCmdSetCheckpointNV" vkCmdSetCheckpointNV) :void 
  (commandBuffer VkCommandBuffer)
  (pCheckpointMarker (:pointer :void)))

(cffi:defcfun ("vkGetQueueCheckpointDataNV" vkGetQueueCheckpointDataNV) :void 
  (queue VkQueue)
  (pCheckpointDataCount (:pointer :uint32))
  (pCheckpointData (:pointer VkCheckpointDataNV)))

(cffi:defcfun ("vkInitializePerformanceApiINTEL" vkInitializePerformanceApiINTEL) VkResult 
  (device VkDevice)
  (pInitializeInfo (:pointer VkInitializePerformanceApiInfoINTEL)))

(cffi:defcfun ("vkUninitializePerformanceApiINTEL" vkUninitializePerformanceApiINTEL) :void 
  (device VkDevice))

(cffi:defcfun ("vkCmdSetPerformanceMarkerINTEL" vkCmdSetPerformanceMarkerINTEL) VkResult 
  (commandBuffer VkCommandBuffer)
  (pMarkerInfo (:pointer VkPerformanceMarkerInfoINTEL)))

(cffi:defcfun ("vkCmdSetPerformanceStreamMarkerINTEL" vkCmdSetPerformanceStreamMarkerINTEL) VkResult 
  (commandBuffer VkCommandBuffer)
  (pMarkerInfo (:pointer VkPerformanceStreamMarkerInfoINTEL)))

(cffi:defcfun ("vkCmdSetPerformanceOverrideINTEL" vkCmdSetPerformanceOverrideINTEL) VkResult 
  (commandBuffer VkCommandBuffer)
  (pOverrideInfo (:pointer VkPerformanceOverrideInfoINTEL)))

(cffi:defcfun ("vkAcquirePerformanceConfigurationINTEL" vkAcquirePerformanceConfigurationINTEL) VkResult 
  (device VkDevice)
  (pAcquireInfo (:pointer VkPerformanceConfigurationAcquireInfoINTEL))
  (pConfiguration (:pointer VkPerformanceConfigurationINTEL)))

(cffi:defcfun ("vkReleasePerformanceConfigurationINTEL" vkReleasePerformanceConfigurationINTEL) VkResult 
  (device VkDevice)
  (configuration VkPerformanceConfigurationINTEL))

(cffi:defcfun ("vkQueueSetPerformanceConfigurationINTEL" vkQueueSetPerformanceConfigurationINTEL) VkResult 
  (queue VkQueue)
  (configuration VkPerformanceConfigurationINTEL))

(cffi:defcfun ("vkGetPerformanceParameterINTEL" vkGetPerformanceParameterINTEL) VkResult 
  (device VkDevice)
  (parameter VkPerformanceParameterTypeINTEL)
  (pValue (:pointer VkPerformanceValueINTEL)))

(cffi:defcfun ("vkSetLocalDimmingAMD" vkSetLocalDimmingAMD) :void 
  (device VkDevice)
  (swapChain VkSwapchainKHR)
  (localDimmingEnable VkBool32))

(cffi:defcfun ("vkGetBufferDeviceAddressEXT" vkGetBufferDeviceAddressEXT) VkDeviceAddress 
  (device VkDevice)
  (pInfo (:pointer VkBufferDeviceAddressInfo)))

(cffi:defcfun ("vkGetPhysicalDeviceToolPropertiesEXT" vkGetPhysicalDeviceToolPropertiesEXT) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pToolCount (:pointer :uint32))
  (pToolProperties (:pointer VkPhysicalDeviceToolProperties)))

(cffi:defcfun ("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV" vkGetPhysicalDeviceCooperativeMatrixPropertiesNV) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pPropertyCount (:pointer :uint32))
  (pProperties (:pointer VkCooperativeMatrixPropertiesNV)))

(cffi:defcfun ("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV" vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV) VkResult 
  (physicalDevice VkPhysicalDevice)
  (pCombinationCount (:pointer :uint32))
  (pCombinations (:pointer VkFramebufferMixedSamplesCombinationNV)))

(cffi:defcfun ("vkCreateHeadlessSurfaceEXT" vkCreateHeadlessSurfaceEXT) VkResult 
  (instance VkInstance)
  (pCreateInfo (:pointer VkHeadlessSurfaceCreateInfoEXT))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pSurface (:pointer VkSurfaceKHR)))

(cffi:defcfun ("vkCmdSetLineStippleEXT" vkCmdSetLineStippleEXT) :void 
  (commandBuffer VkCommandBuffer)
  (lineStippleFactor :uint32)
  (lineStipplePattern :uint16))

(cffi:defcfun ("vkResetQueryPoolEXT" vkResetQueryPoolEXT) :void 
  (device VkDevice)
  (queryPool VkQueryPool)
  (firstQuery :uint32)
  (queryCount :uint32))

(cffi:defcfun ("vkCmdSetCullModeEXT" vkCmdSetCullModeEXT) :void 
  (commandBuffer VkCommandBuffer)
  (cullMode VkCullModeFlags))

(cffi:defcfun ("vkCmdSetFrontFaceEXT" vkCmdSetFrontFaceEXT) :void 
  (commandBuffer VkCommandBuffer)
  (frontFace VkFrontFace))

(cffi:defcfun ("vkCmdSetPrimitiveTopologyEXT" vkCmdSetPrimitiveTopologyEXT) :void 
  (commandBuffer VkCommandBuffer)
  (primitiveTopology VkPrimitiveTopology))

(cffi:defcfun ("vkCmdSetViewportWithCountEXT" vkCmdSetViewportWithCountEXT) :void 
  (commandBuffer VkCommandBuffer)
  (viewportCount :uint32)
  (pViewports (:pointer VkViewport)))

(cffi:defcfun ("vkCmdSetScissorWithCountEXT" vkCmdSetScissorWithCountEXT) :void 
  (commandBuffer VkCommandBuffer)
  (scissorCount :uint32)
  (pScissors (:pointer VkRect2D)))

(cffi:defcfun ("vkCmdBindVertexBuffers2EXT" vkCmdBindVertexBuffers2EXT) :void 
  (commandBuffer VkCommandBuffer)
  (firstBinding :uint32)
  (bindingCount :uint32)
  (pBuffers (:pointer VkBuffer))
  (pOffsets (:pointer VkDeviceSize))
  (pSizes (:pointer VkDeviceSize))
  (pStrides (:pointer VkDeviceSize)))

(cffi:defcfun ("vkCmdSetDepthTestEnableEXT" vkCmdSetDepthTestEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (depthTestEnable VkBool32))

(cffi:defcfun ("vkCmdSetDepthWriteEnableEXT" vkCmdSetDepthWriteEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (depthWriteEnable VkBool32))

(cffi:defcfun ("vkCmdSetDepthCompareOpEXT" vkCmdSetDepthCompareOpEXT) :void 
  (commandBuffer VkCommandBuffer)
  (depthCompareOp VkCompareOp))

(cffi:defcfun ("vkCmdSetDepthBoundsTestEnableEXT" vkCmdSetDepthBoundsTestEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (depthBoundsTestEnable VkBool32))

(cffi:defcfun ("vkCmdSetStencilTestEnableEXT" vkCmdSetStencilTestEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (stencilTestEnable VkBool32))

(cffi:defcfun ("vkCmdSetStencilOpEXT" vkCmdSetStencilOpEXT) :void 
  (commandBuffer VkCommandBuffer)
  (faceMask VkStencilFaceFlags)
  (failOp VkStencilOp)
  (passOp VkStencilOp)
  (depthFailOp VkStencilOp)
  (compareOp VkCompareOp))

(cffi:defcfun ("vkGetGeneratedCommandsMemoryRequirementsNV" vkGetGeneratedCommandsMemoryRequirementsNV) :void 
  (device VkDevice)
  (pInfo (:pointer VkGeneratedCommandsMemoryRequirementsInfoNV))
  (pMemoryRequirements (:pointer VkMemoryRequirements2)))

(cffi:defcfun ("vkCmdPreprocessGeneratedCommandsNV" vkCmdPreprocessGeneratedCommandsNV) :void 
  (commandBuffer VkCommandBuffer)
  (pGeneratedCommandsInfo (:pointer VkGeneratedCommandsInfoNV)))

(cffi:defcfun ("vkCmdExecuteGeneratedCommandsNV" vkCmdExecuteGeneratedCommandsNV) :void 
  (commandBuffer VkCommandBuffer)
  (isPreprocessed VkBool32)
  (pGeneratedCommandsInfo (:pointer VkGeneratedCommandsInfoNV)))

(cffi:defcfun ("vkCmdBindPipelineShaderGroupNV" vkCmdBindPipelineShaderGroupNV) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineBindPoint VkPipelineBindPoint)
  (pipeline VkPipeline)
  (groupIndex :uint32))

(cffi:defcfun ("vkCreateIndirectCommandsLayoutNV" vkCreateIndirectCommandsLayoutNV) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkIndirectCommandsLayoutCreateInfoNV))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pIndirectCommandsLayout (:pointer VkIndirectCommandsLayoutNV)))

(cffi:defcfun ("vkDestroyIndirectCommandsLayoutNV" vkDestroyIndirectCommandsLayoutNV) :void 
  (device VkDevice)
  (indirectCommandsLayout VkIndirectCommandsLayoutNV)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkAcquireDrmDisplayEXT" vkAcquireDrmDisplayEXT) VkResult 
  (physicalDevice VkPhysicalDevice)
  (drmFd :int32)
  (display VkDisplayKHR))

(cffi:defcfun ("vkGetDrmDisplayEXT" vkGetDrmDisplayEXT) VkResult 
  (physicalDevice VkPhysicalDevice)
  (drmFd :int32)
  (connectorId :uint32)
  (display (:pointer VkDisplayKHR)))

(cffi:defcfun ("vkCreatePrivateDataSlotEXT" vkCreatePrivateDataSlotEXT) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkPrivateDataSlotCreateInfo))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPrivateDataSlot (:pointer VkPrivateDataSlot)))

(cffi:defcfun ("vkDestroyPrivateDataSlotEXT" vkDestroyPrivateDataSlotEXT) :void 
  (device VkDevice)
  (privateDataSlot VkPrivateDataSlot)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkSetPrivateDataEXT" vkSetPrivateDataEXT) VkResult 
  (device VkDevice)
  (objectType VkObjectType)
  (objectHandle :uint64)
  (privateDataSlot VkPrivateDataSlot)
  (data :uint64))

(cffi:defcfun ("vkGetPrivateDataEXT" vkGetPrivateDataEXT) :void 
  (device VkDevice)
  (objectType VkObjectType)
  (objectHandle :uint64)
  (privateDataSlot VkPrivateDataSlot)
  (pData (:pointer :uint64)))

(cffi:defcfun ("vkCmdSetFragmentShadingRateEnumNV" vkCmdSetFragmentShadingRateEnumNV) :void 
  (commandBuffer VkCommandBuffer)
  (shadingRate VkFragmentShadingRateNV)
  (combinerOps[2] VkFragmentShadingRateCombinerOpKHR))

(cffi:defcfun ("vkGetImageSubresourceLayout2EXT" vkGetImageSubresourceLayout2EXT) :void 
  (device VkDevice)
  (image VkImage)
  (pSubresource (:pointer VkImageSubresource2EXT))
  (pLayout (:pointer VkSubresourceLayout2EXT)))

(cffi:defcfun ("vkAcquireWinrtDisplayNV" vkAcquireWinrtDisplayNV) VkResult 
  (physicalDevice VkPhysicalDevice)
  (display VkDisplayKHR))

(cffi:defcfun ("vkGetWinrtDisplayNV" vkGetWinrtDisplayNV) VkResult 
  (physicalDevice VkPhysicalDevice)
  (deviceRelativeId :uint32)
  (pDisplay (:pointer VkDisplayKHR)))

(cffi:defcfun ("vkCmdSetVertexInputEXT" vkCmdSetVertexInputEXT) :void 
  (commandBuffer VkCommandBuffer)
  (vertexBindingDescriptionCount :uint32)
  (pVertexBindingDescriptions (:pointer VkVertexInputBindingDescription2EXT))
  (vertexAttributeDescriptionCount :uint32)
  (pVertexAttributeDescriptions (:pointer VkVertexInputAttributeDescription2EXT)))

(cffi:defcfun ("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI" vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI) VkResult 
  (device VkDevice)
  (renderpass VkRenderPass)
  (pMaxWorkgroupSize (:pointer VkExtent2D)))

(cffi:defcfun ("vkCmdSubpassShadingHUAWEI" vkCmdSubpassShadingHUAWEI) :void 
  (commandBuffer VkCommandBuffer))

(cffi:defcfun ("vkCmdBindInvocationMaskHUAWEI" vkCmdBindInvocationMaskHUAWEI) :void 
  (commandBuffer VkCommandBuffer)
  (imageView VkImageView)
  (imageLayout VkImageLayout))

(cffi:defcfun ("vkGetMemoryRemoteAddressNV" vkGetMemoryRemoteAddressNV) VkResult 
  (device VkDevice)
  (pMemoryGetRemoteAddressInfo (:pointer VkMemoryGetRemoteAddressInfoNV))
  (pAddress (:pointer VkRemoteAddressNV)))

(cffi:defcfun ("vkGetPipelinePropertiesEXT" vkGetPipelinePropertiesEXT) VkResult 
  (device VkDevice)
  (pPipelineInfo (:pointer VkPipelineInfoEXT))
  (pPipelineProperties (:pointer VkBaseOutStructure)))

(cffi:defcfun ("vkCmdSetPatchControlPointsEXT" vkCmdSetPatchControlPointsEXT) :void 
  (commandBuffer VkCommandBuffer)
  (patchControlPoints :uint32))

(cffi:defcfun ("vkCmdSetRasterizerDiscardEnableEXT" vkCmdSetRasterizerDiscardEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (rasterizerDiscardEnable VkBool32))

(cffi:defcfun ("vkCmdSetDepthBiasEnableEXT" vkCmdSetDepthBiasEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (depthBiasEnable VkBool32))

(cffi:defcfun ("vkCmdSetLogicOpEXT" vkCmdSetLogicOpEXT) :void 
  (commandBuffer VkCommandBuffer)
  (logicOp VkLogicOp))

(cffi:defcfun ("vkCmdSetPrimitiveRestartEnableEXT" vkCmdSetPrimitiveRestartEnableEXT) :void 
  (commandBuffer VkCommandBuffer)
  (primitiveRestartEnable VkBool32))

(cffi:defcfun ("vkCmdSetColorWriteEnableEXT" vkCmdSetColorWriteEnableEXT) :void                                    
  (commandBuffer VkCommandBuffer)
  (attachmentCount :uint32)
  (pColorWriteEnables (:pointer VkBool32)))

(cffi:defcfun ("vkCmdDrawMultiEXT" vkCmdDrawMultiEXT) :void 
  (commandBuffer VkCommandBuffer)
  (drawCount :uint32)
  (pVertexInfo (:pointer VkMultiDrawInfoEXT))
  (instanceCount :uint32)
  (firstInstance :uint32)
  (stride :uint32))

(cffi:defcfun ("vkCmdDrawMultiIndexedEXT" vkCmdDrawMultiIndexedEXT) :void 
  (commandBuffer VkCommandBuffer)
  (drawCount :uint32)
  (pIndexInfo (:pointer VkMultiDrawIndexedInfoEXT))
  (instanceCount :uint32)
  (firstInstance :uint32)
  (stride :uint32)
  (pVertexOffset (:pointer :int32)))

(cffi:defcfun ("vkSetDeviceMemoryPriorityEXT" vkSetDeviceMemoryPriorityEXT) :void 
  (device VkDevice)
  (memory VkDeviceMemory)
  (priority :float))

(cffi:defcfun ("vkGetDescriptorSetLayoutHostMappingInfoVALVE" vkGetDescriptorSetLayoutHostMappingInfoVALVE) :void 
  (device VkDevice)
  (pBindingReference (:pointer VkDescriptorSetBindingReferenceVALVE))
  (pHostMapping (:pointer VkDescriptorSetLayoutHostMappingInfoVALVE)))

(cffi:defcfun ("vkGetDescriptorSetHostMappingVALVE" vkGetDescriptorSetHostMappingVALVE) :void 
  (device VkDevice)
  (descriptorSet VkDescriptorSet)
  (* (:pointer :void))                                      ppData)

(cffi:defcfun ("vkCreateAccelerationStructureKHR" vkCreateAccelerationStructureKHR) VkResult 
  (device VkDevice)
  (pCreateInfo (:pointer VkAccelerationStructureCreateInfoKHR))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pAccelerationStructure (:pointer VkAccelerationStructureKHR)))

(cffi:defcfun ("vkDestroyAccelerationStructureKHR" vkDestroyAccelerationStructureKHR) :void 
  (device VkDevice)
  (accelerationStructure VkAccelerationStructureKHR)
  (pAllocator (:pointer VkAllocationCallbacks)))

(cffi:defcfun ("vkCmdBuildAccelerationStructuresKHR" vkCmdBuildAccelerationStructuresKHR) :void 
  (commandBuffer VkCommandBuffer)
  (infoCount :uint32)
  (pInfos (:pointer VkAccelerationStructureBuildGeometryInfoKHR))
  (const* (:pointer VkAccelerationStructureBuildRangeInfoKHR)) ppBuildRangeInfos)

(cffi:defcfun ("vkCmdBuildAccelerationStructuresIndirectKHR" vkCmdBuildAccelerationStructuresIndirectKHR) :void 
  (commandBuffer VkCommandBuffer)
  (infoCount :uint32)
  (pInfos (:pointer VkAccelerationStructureBuildGeometryInfoKHR))
  (pIndirectDeviceAddresses (:pointer VkDeviceAddress))
  (pIndirectStrides (:pointer :uint32))
  (const* (:pointer :uint32))                      ppMaxPrimitiveCounts)

(cffi:defcfun ("vkBuildAccelerationStructuresKHR" vkBuildAccelerationStructuresKHR) VkResult 
  (device VkDevice)
  (deferredOperation VkDeferredOperationKHR)
  (infoCount :uint32)
  (pInfos (:pointer VkAccelerationStructureBuildGeometryInfoKHR))
  (const* (:pointer VkAccelerationStructureBuildRangeInfoKHR)) ppBuildRangeInfos)

(cffi:defcfun ("vkCopyAccelerationStructureKHR" vkCopyAccelerationStructureKHR) VkResult 
  (device VkDevice)
  (deferredOperation VkDeferredOperationKHR)
  (pInfo (:pointer VkCopyAccelerationStructureInfoKHR)))

(cffi:defcfun ("vkCopyAccelerationStructureToMemoryKHR" vkCopyAccelerationStructureToMemoryKHR) VkResult 
  (device VkDevice)
  (deferredOperation VkDeferredOperationKHR)
  (pInfo (:pointer VkCopyAccelerationStructureToMemoryInfoKHR)))

(cffi:defcfun ("vkCopyMemoryToAccelerationStructureKHR" vkCopyMemoryToAccelerationStructureKHR) VkResult 
  (device VkDevice)
  (deferredOperation VkDeferredOperationKHR)
  (pInfo (:pointer VkCopyMemoryToAccelerationStructureInfoKHR)))

(cffi:defcfun ("vkWriteAccelerationStructuresPropertiesKHR" vkWriteAccelerationStructuresPropertiesKHR) VkResult 
  (device VkDevice)
  (accelerationStructureCount :uint32)
  (pAccelerationStructures (:pointer VkAccelerationStructureKHR))
  (queryType VkQueryType)
  (dataSize :size)
  (pData (:pointer :void))
  (stride :size))

(cffi:defcfun ("vkCmdCopyAccelerationStructureKHR" vkCmdCopyAccelerationStructureKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pInfo (:pointer VkCopyAccelerationStructureInfoKHR)))

(cffi:defcfun ("vkCmdCopyAccelerationStructureToMemoryKHR" vkCmdCopyAccelerationStructureToMemoryKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pInfo (:pointer VkCopyAccelerationStructureToMemoryInfoKHR)))

(cffi:defcfun ("vkCmdCopyMemoryToAccelerationStructureKHR" vkCmdCopyMemoryToAccelerationStructureKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pInfo (:pointer VkCopyMemoryToAccelerationStructureInfoKHR)))

(cffi:defcfun ("vkGetAccelerationStructureDeviceAddressKHR" vkGetAccelerationStructureDeviceAddressKHR) VkDeviceAddress 
  (device VkDevice)
  (pInfo (:pointer VkAccelerationStructureDeviceAddressInfoKHR)))

(cffi:defcfun ("vkCmdWriteAccelerationStructuresPropertiesKHR" vkCmdWriteAccelerationStructuresPropertiesKHR) :void 
  (commandBuffer VkCommandBuffer)
  (accelerationStructureCount :uint32)
  (pAccelerationStructures (:pointer VkAccelerationStructureKHR))
  (queryType VkQueryType)
  (queryPool VkQueryPool)
  (firstQuery :uint32))

(cffi:defcfun ("vkGetDeviceAccelerationStructureCompatibilityKHR" vkGetDeviceAccelerationStructureCompatibilityKHR) :void 
  (device VkDevice)
  (pVersionInfo (:pointer VkAccelerationStructureVersionInfoKHR))
  (pCompatibility (:pointer VkAccelerationStructureCompatibilityKHR)))

(cffi:defcfun ("vkGetAccelerationStructureBuildSizesKHR" vkGetAccelerationStructureBuildSizesKHR) :void 
  (device VkDevice)
  (buildType VkAccelerationStructureBuildTypeKHR)
  (pBuildInfo (:pointer VkAccelerationStructureBuildGeometryInfoKHR))
  (pMaxPrimitiveCounts (:pointer :uint32))
  (pSizeInfo (:pointer VkAccelerationStructureBuildSizesInfoKHR)))

(cffi:defcfun ("vkCmdTraceRaysKHR" vkCmdTraceRaysKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pRaygenShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (pMissShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (pHitShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (pCallableShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcfun ("vkCreateRayTracingPipelinesKHR" vkCreateRayTracingPipelinesKHR) VkResult 
  (device VkDevice)
  (deferredOperation VkDeferredOperationKHR)
  (pipelineCache VkPipelineCache)
  (createInfoCount :uint32)
  (pCreateInfos (:pointer VkRayTracingPipelineCreateInfoKHR))
  (pAllocator (:pointer VkAllocationCallbacks))
  (pPipelines (:pointer VkPipeline)))

(cffi:defcfun ("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR" vkGetRayTracingCaptureReplayShaderGroupHandlesKHR) VkResult 
  (device VkDevice)
  (pipeline VkPipeline)
  (firstGroup :uint32)
  (groupCount :uint32)
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcfun ("vkCmdTraceRaysIndirectKHR" vkCmdTraceRaysIndirectKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pRaygenShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (pMissShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (pHitShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (pCallableShaderBindingTable (:pointer VkStridedDeviceAddressRegionKHR))
  (indirectDeviceAddress VkDeviceAddress))

(cffi:defcfun ("vkGetRayTracingShaderGroupStackSizeKHR" vkGetRayTracingShaderGroupStackSizeKHR) VkDeviceSize 
  (device VkDevice)
  (pipeline VkPipeline)
  (group :uint32)
  (groupShader VkShaderGroupShaderKHR))

(cffi:defcfun ("vkCmdSetRayTracingPipelineStackSizeKHR" vkCmdSetRayTracingPipelineStackSizeKHR) :void 
  (commandBuffer VkCommandBuffer)
  (pipelineStackSize :uint32))
