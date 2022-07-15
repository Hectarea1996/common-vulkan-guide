
(cffi:defcstruct VkExtent2D 
  (width :uint32)
  (height :uint32))

(cffi:defcstruct VkExtent3D 
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcstruct VkOffset2D 
  (x :int32)
  (y :int32))

(cffi:defcstruct VkOffset3D 
  (x :int32)
  (y :int32)
  (z :int32))

(cffi:defcstruct VkRect2D 
  (offset VkOffset2D)
  (extent VkExtent2D))

(cffi:defcstruct VkBaseInStructure 
  (sType VkStructureType)
  (pNext (:pointer VkBaseInStructure)))

(cffi:defcstruct VkBaseOutStructure 
  (sType VkStructureType)
  (pNext (:pointer VkBaseOutStructure)))

(cffi:defcstruct VkBufferMemoryBarrier 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcAccessMask VkAccessFlags)
  (dstAccessMask VkAccessFlags)
  (srcQueueFamilyIndex :uint32)
  (dstQueueFamilyIndex :uint32)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (size VkDeviceSize))

(cffi:defcstruct VkDispatchIndirectCommand 
  (x :uint32)
  (y :uint32)
  (z :uint32))

(cffi:defcstruct VkDrawIndexedIndirectCommand 
  (indexCount :uint32)
  (instanceCount :uint32)
  (firstIndex :uint32)
  (vertexOffset :int32)
  (firstInstance :uint32))

(cffi:defcstruct VkDrawIndirectCommand 
  (vertexCount :uint32)
  (instanceCount :uint32)
  (firstVertex :uint32)
  (firstInstance :uint32))

(cffi:defcstruct VkImageSubresourceRange 
  (aspectMask VkImageAspectFlags)
  (baseMipLevel :uint32)
  (levelCount :uint32)
  (baseArrayLayer :uint32)
  (layerCount :uint32))

(cffi:defcstruct VkImageMemoryBarrier 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcAccessMask VkAccessFlags)
  (dstAccessMask VkAccessFlags)
  (oldLayout VkImageLayout)
  (newLayout VkImageLayout)
  (srcQueueFamilyIndex :uint32)
  (dstQueueFamilyIndex :uint32)
  (image VkImage)
  (subresourceRange VkImageSubresourceRange))

(cffi:defcstruct VkMemoryBarrier 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcAccessMask VkAccessFlags)
  (dstAccessMask VkAccessFlags))

(cffi:defcstruct VkPipelineCacheHeaderVersionOne 
  (headerSize :uint32)
  (headerVersion VkPipelineCacheHeaderVersion)
  (vendorID :uint32)
  (deviceID :uint32)
  (pipelineCacheUUID :uint8 :count VK_UUID_SIZE))

(cffi:defcstruct VkAllocationCallbacks 
  (pUserData (:pointer :void))
  (pfnAllocation :PFN_vkAllocationFunction)
  (pfnReallocation :PFN_vkReallocationFunction)
  (pfnFree :PFN_vkFreeFunction)
  (pfnInternalAllocation :PFN_vkInternalAllocationNotification)
  (pfnInternalFree :PFN_vkInternalFreeNotification))

(cffi:defcstruct VkApplicationInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pApplicationName (:pointer :char))
  (applicationVersion :uint32)
  (pEngineName (:pointer :char))
  (engineVersion :uint32)
  (apiVersion :uint32))

(cffi:defcstruct VkFormatProperties 
  (linearTilingFeatures VkFormatFeatureFlags)
  (optimalTilingFeatures VkFormatFeatureFlags)
  (bufferFeatures VkFormatFeatureFlags))

(cffi:defcstruct VkImageFormatProperties 
  (maxExtent VkExtent3D)
  (maxMipLevels :uint32)
  (maxArrayLayers :uint32)
  (sampleCounts VkSampleCountFlags)
  (maxResourceSize VkDeviceSize))

(cffi:defcstruct VkInstanceCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkInstanceCreateFlags)
  (pApplicationInfo (:pointer VkApplicationInfo))
  (enabledLayerCount :uint32)
  (ppEnabledLayerNames (:pointer :char))
  (enabledExtensionCount :uint32)
  (ppEnabledExtensionNames (:pointer :char)))

(cffi:defcstruct VkMemoryHeap 
  (size VkDeviceSize)
  (flags VkMemoryHeapFlags))

(cffi:defcstruct VkMemoryType 
  (propertyFlags VkMemoryPropertyFlags)
  (heapIndex :uint32))

(cffi:defcstruct VkPhysicalDeviceFeatures 
  (robustBufferAccess VkBool32)
  (fullDrawIndexUint32 VkBool32)
  (imageCubeArray VkBool32)
  (independentBlend VkBool32)
  (geometryShader VkBool32)
  (tessellationShader VkBool32)
  (sampleRateShading VkBool32)
  (dualSrcBlend VkBool32)
  (logicOp VkBool32)
  (multiDrawIndirect VkBool32)
  (drawIndirectFirstInstance VkBool32)
  (depthClamp VkBool32)
  (depthBiasClamp VkBool32)
  (fillModeNonSolid VkBool32)
  (depthBounds VkBool32)
  (wideLines VkBool32)
  (largePoints VkBool32)
  (alphaToOne VkBool32)
  (multiViewport VkBool32)
  (samplerAnisotropy VkBool32)
  (textureCompressionETC2 VkBool32)
  (textureCompressionASTC_LDR VkBool32)
  (textureCompressionBC VkBool32)
  (occlusionQueryPrecise VkBool32)
  (pipelineStatisticsQuery VkBool32)
  (vertexPipelineStoresAndAtomics VkBool32)
  (fragmentStoresAndAtomics VkBool32)
  (shaderTessellationAndGeometryPointSize VkBool32)
  (shaderImageGatherExtended VkBool32)
  (shaderStorageImageExtendedFormats VkBool32)
  (shaderStorageImageMultisample VkBool32)
  (shaderStorageImageReadWithoutFormat VkBool32)
  (shaderStorageImageWriteWithoutFormat VkBool32)
  (shaderUniformBufferArrayDynamicIndexing VkBool32)
  (shaderSampledImageArrayDynamicIndexing VkBool32)
  (shaderStorageBufferArrayDynamicIndexing VkBool32)
  (shaderStorageImageArrayDynamicIndexing VkBool32)
  (shaderClipDistance VkBool32)
  (shaderCullDistance VkBool32)
  (shaderFloat64 VkBool32)
  (shaderInt64 VkBool32)
  (shaderInt16 VkBool32)
  (shaderResourceResidency VkBool32)
  (shaderResourceMinLod VkBool32)
  (sparseBinding VkBool32)
  (sparseResidencyBuffer VkBool32)
  (sparseResidencyImage2D VkBool32)
  (sparseResidencyImage3D VkBool32)
  (sparseResidency2Samples VkBool32)
  (sparseResidency4Samples VkBool32)
  (sparseResidency8Samples VkBool32)
  (sparseResidency16Samples VkBool32)
  (sparseResidencyAliased VkBool32)
  (variableMultisampleRate VkBool32)
  (inheritedQueries VkBool32))

(cffi:defcstruct VkPhysicalDeviceLimits 
  (maxImageDimension1D :uint32)
  (maxImageDimension2D :uint32)
  (maxImageDimension3D :uint32)
  (maxImageDimensionCube :uint32)
  (maxImageArrayLayers :uint32)
  (maxTexelBufferElements :uint32)
  (maxUniformBufferRange :uint32)
  (maxStorageBufferRange :uint32)
  (maxPushConstantsSize :uint32)
  (maxMemoryAllocationCount :uint32)
  (maxSamplerAllocationCount :uint32)
  (bufferImageGranularity VkDeviceSize)
  (sparseAddressSpaceSize VkDeviceSize)
  (maxBoundDescriptorSets :uint32)
  (maxPerStageDescriptorSamplers :uint32)
  (maxPerStageDescriptorUniformBuffers :uint32)
  (maxPerStageDescriptorStorageBuffers :uint32)
  (maxPerStageDescriptorSampledImages :uint32)
  (maxPerStageDescriptorStorageImages :uint32)
  (maxPerStageDescriptorInputAttachments :uint32)
  (maxPerStageResources :uint32)
  (maxDescriptorSetSamplers :uint32)
  (maxDescriptorSetUniformBuffers :uint32)
  (maxDescriptorSetUniformBuffersDynamic :uint32)
  (maxDescriptorSetStorageBuffers :uint32)
  (maxDescriptorSetStorageBuffersDynamic :uint32)
  (maxDescriptorSetSampledImages :uint32)
  (maxDescriptorSetStorageImages :uint32)
  (maxDescriptorSetInputAttachments :uint32)
  (maxVertexInputAttributes :uint32)
  (maxVertexInputBindings :uint32)
  (maxVertexInputAttributeOffset :uint32)
  (maxVertexInputBindingStride :uint32)
  (maxVertexOutputComponents :uint32)
  (maxTessellationGenerationLevel :uint32)
  (maxTessellationPatchSize :uint32)
  (maxTessellationControlPerVertexInputComponents :uint32)
  (maxTessellationControlPerVertexOutputComponents :uint32)
  (maxTessellationControlPerPatchOutputComponents :uint32)
  (maxTessellationControlTotalOutputComponents :uint32)
  (maxTessellationEvaluationInputComponents :uint32)
  (maxTessellationEvaluationOutputComponents :uint32)
  (maxGeometryShaderInvocations :uint32)
  (maxGeometryInputComponents :uint32)
  (maxGeometryOutputComponents :uint32)
  (maxGeometryOutputVertices :uint32)
  (maxGeometryTotalOutputComponents :uint32)
  (maxFragmentInputComponents :uint32)
  (maxFragmentOutputAttachments :uint32)
  (maxFragmentDualSrcAttachments :uint32)
  (maxFragmentCombinedOutputResources :uint32)
  (maxComputeSharedMemorySize :uint32)
  (maxComputeWorkGroupCount :uint32 :count 3)
  (maxComputeWorkGroupInvocations :uint32)
  (maxComputeWorkGroupSize :uint32 :count 3)
  (subPixelPrecisionBits :uint32)
  (subTexelPrecisionBits :uint32)
  (mipmapPrecisionBits :uint32)
  (maxDrawIndexedIndexValue :uint32)
  (maxDrawIndirectCount :uint32)
  (maxSamplerLodBias :float)
  (maxSamplerAnisotropy :float)
  (maxViewports :uint32)
  (maxViewportDimensions :uint32 :count 2)
  (viewportBoundsRange :float :count 2)
  (viewportSubPixelBits :uint32)
  (minMemoryMapAlignment :size)
  (minTexelBufferOffsetAlignment VkDeviceSize)
  (minUniformBufferOffsetAlignment VkDeviceSize)
  (minStorageBufferOffsetAlignment VkDeviceSize)
  (minTexelOffset :int32)
  (maxTexelOffset :uint32)
  (minTexelGatherOffset :int32)
  (maxTexelGatherOffset :uint32)
  (minInterpolationOffset :float)
  (maxInterpolationOffset :float)
  (subPixelInterpolationOffsetBits :uint32)
  (maxFramebufferWidth :uint32)
  (maxFramebufferHeight :uint32)
  (maxFramebufferLayers :uint32)
  (framebufferColorSampleCounts VkSampleCountFlags)
  (framebufferDepthSampleCounts VkSampleCountFlags)
  (framebufferStencilSampleCounts VkSampleCountFlags)
  (framebufferNoAttachmentsSampleCounts VkSampleCountFlags)
  (maxColorAttachments :uint32)
  (sampledImageColorSampleCounts VkSampleCountFlags)
  (sampledImageIntegerSampleCounts VkSampleCountFlags)
  (sampledImageDepthSampleCounts VkSampleCountFlags)
  (sampledImageStencilSampleCounts VkSampleCountFlags)
  (storageImageSampleCounts VkSampleCountFlags)
  (maxSampleMaskWords :uint32)
  (timestampComputeAndGraphics VkBool32)
  (timestampPeriod :float)
  (maxClipDistances :uint32)
  (maxCullDistances :uint32)
  (maxCombinedClipAndCullDistances :uint32)
  (discreteQueuePriorities :uint32)
  (pointSizeRange :float :count 2)
  (lineWidthRange :float :count 2)
  (pointSizeGranularity :float)
  (lineWidthGranularity :float)
  (strictLines VkBool32)
  (standardSampleLocations VkBool32)
  (optimalBufferCopyOffsetAlignment VkDeviceSize)
  (optimalBufferCopyRowPitchAlignment VkDeviceSize)
  (nonCoherentAtomSize VkDeviceSize))

(cffi:defcstruct VkPhysicalDeviceMemoryProperties 
  (memoryTypeCount :uint32)
  (memoryTypes VkMemoryType :count VK_MAX_MEMORYYPES)
  (memoryHeapCount :uint32)
  (memoryHeaps VkMemoryHeap :count VK_MAX_MEMORY_HEAPS))

(cffi:defcstruct VkPhysicalDeviceSparseProperties 
  (residencyStandard2DBlockShape VkBool32)
  (residencyStandard2DMultisampleBlockShape VkBool32)
  (residencyStandard3DBlockShape VkBool32)
  (residencyAlignedMipSize VkBool32)
  (residencyNonResidentStrict VkBool32))

(cffi:defcstruct VkPhysicalDeviceProperties 
  (apiVersion :uint32)
  (driverVersion :uint32)
  (vendorID :uint32)
  (deviceID :uint32)
  (deviceType VkPhysicalDeviceType)
  (deviceName :char :count VK_MAX_PHYSICAL_DEVICE_NAME_SIZE)
  (pipelineCacheUUID :uint8 :count VK_UUID_SIZE)
  (limits VkPhysicalDeviceLimits)
  (sparseProperties VkPhysicalDeviceSparseProperties))

(cffi:defcstruct VkQueueFamilyProperties 
  (queueFlags VkQueueFlags)
  (queueCount :uint32)
  (timestampValidBits :uint32)
  (minImageTransferGranularity VkExtent3D))

(cffi:defcstruct VkDeviceQueueCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDeviceQueueCreateFlags)
  (queueFamilyIndex :uint32)
  (queueCount :uint32)
  (pQueuePriorities (:pointer :float)))

(cffi:defcstruct VkDeviceCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDeviceCreateFlags)
  (queueCreateInfoCount :uint32)
  (pQueueCreateInfos (:pointer VkDeviceQueueCreateInfo))
  (enabledLayerCount :uint32)
  (ppEnabledLayerNames (:pointer :char))
  (enabledExtensionCount :uint32)
  (ppEnabledExtensionNames (:pointer :char))
  (pEnabledFeatures (:pointer VkPhysicalDeviceFeatures)))

(cffi:defcstruct VkExtensionProperties 
  (extensionName :char :count VK_MAX_EXTENSION_NAME_SIZE)
  (specVersion :uint32))

(cffi:defcstruct VkLayerProperties 
  (layerName :char :count VK_MAX_EXTENSION_NAME_SIZE)
  (specVersion :uint32)
  (implementationVersion :uint32)
  (description :char :count VK_MAX_DESCRIPTION_SIZE))

(cffi:defcstruct VkSubmitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (waitSemaphoreCount :uint32)
  (pWaitSemaphores (:pointer VkSemaphore))
  (pWaitDstStageMask (:pointer VkPipelineStageFlags))
  (commandBufferCount :uint32)
  (pCommandBuffers (:pointer VkCommandBuffer))
  (signalSemaphoreCount :uint32)
  (pSignalSemaphores (:pointer VkSemaphore)))

(cffi:defcstruct VkMappedMemoryRange 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memory VkDeviceMemory)
  (offset VkDeviceSize)
  (size VkDeviceSize))

(cffi:defcstruct VkMemoryAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (allocationSize VkDeviceSize)
  (memoryTypeIndex :uint32))

(cffi:defcstruct VkMemoryRequirements 
  (size VkDeviceSize)
  (alignment VkDeviceSize)
  (memoryTypeBits :uint32))

(cffi:defcstruct VkSparseMemoryBind 
  (resourceOffset VkDeviceSize)
  (size VkDeviceSize)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize)
  (flags VkSparseMemoryBindFlags))

(cffi:defcstruct VkSparseBufferMemoryBindInfo 
  (buffer VkBuffer)
  (bindCount :uint32)
  (pBinds (:pointer VkSparseMemoryBind)))

(cffi:defcstruct VkSparseImageOpaqueMemoryBindInfo 
  (image VkImage)
  (bindCount :uint32)
  (pBinds (:pointer VkSparseMemoryBind)))

(cffi:defcstruct VkImageSubresource 
  (aspectMask VkImageAspectFlags)
  (mipLevel :uint32)
  (arrayLayer :uint32))

(cffi:defcstruct VkSparseImageMemoryBind 
  (subresource VkImageSubresource)
  (offset VkOffset3D)
  (extent VkExtent3D)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize)
  (flags VkSparseMemoryBindFlags))

(cffi:defcstruct VkSparseImageMemoryBindInfo 
  (image VkImage)
  (bindCount :uint32)
  (pBinds (:pointer VkSparseImageMemoryBind)))

(cffi:defcstruct VkBindSparseInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (waitSemaphoreCount :uint32)
  (pWaitSemaphores (:pointer VkSemaphore))
  (bufferBindCount :uint32)
  (pBufferBinds (:pointer VkSparseBufferMemoryBindInfo))
  (imageOpaqueBindCount :uint32)
  (pImageOpaqueBinds (:pointer VkSparseImageOpaqueMemoryBindInfo))
  (imageBindCount :uint32)
  (pImageBinds (:pointer VkSparseImageMemoryBindInfo))
  (signalSemaphoreCount :uint32)
  (pSignalSemaphores (:pointer VkSemaphore)))

(cffi:defcstruct VkSparseImageFormatProperties 
  (aspectMask VkImageAspectFlags)
  (imageGranularity VkExtent3D)
  (flags VkSparseImageFormatFlags))

(cffi:defcstruct VkSparseImageMemoryRequirements 
  (formatProperties VkSparseImageFormatProperties)
  (imageMipTailFirstLod :uint32)
  (imageMipTailSize VkDeviceSize)
  (imageMipTailOffset VkDeviceSize)
  (imageMipTailStride VkDeviceSize))

(cffi:defcstruct VkFenceCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkFenceCreateFlags))

(cffi:defcstruct VkSemaphoreCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkSemaphoreCreateFlags))

(cffi:defcstruct VkEventCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkEventCreateFlags))

(cffi:defcstruct VkQueryPoolCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkQueryPoolCreateFlags)
  (queryType VkQueryType)
  (queryCount :uint32)
  (pipelineStatistics VkQueryPipelineStatisticFlags))

(cffi:defcstruct VkBufferCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkBufferCreateFlags)
  (size VkDeviceSize)
  (usage VkBufferUsageFlags)
  (sharingMode VkSharingMode)
  (queueFamilyIndexCount :uint32)
  (pQueueFamilyIndices (:pointer :uint32)))

(cffi:defcstruct VkBufferViewCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkBufferViewCreateFlags)
  (buffer VkBuffer)
  (format VkFormat)
  (offset VkDeviceSize)
  (range VkDeviceSize))

(cffi:defcstruct VkImageCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkImageCreateFlags)
  (imageType VkImageType)
  (format VkFormat)
  (extent VkExtent3D)
  (mipLevels :uint32)
  (arrayLayers :uint32)
  (samples VkSampleCountFlagBits)
  (tiling VkImageTiling)
  (usage VkImageUsageFlags)
  (sharingMode VkSharingMode)
  (queueFamilyIndexCount :uint32)
  (pQueueFamilyIndices (:pointer :uint32))
  (initialLayout VkImageLayout))

(cffi:defcstruct VkSubresourceLayout 
  (offset VkDeviceSize)
  (size VkDeviceSize)
  (rowPitch VkDeviceSize)
  (arrayPitch VkDeviceSize)
  (depthPitch VkDeviceSize))

(cffi:defcstruct VkComponentMapping 
  (r VkComponentSwizzle)
  (g VkComponentSwizzle)
  (b VkComponentSwizzle)
  (a VkComponentSwizzle))

(cffi:defcstruct VkImageViewCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkImageViewCreateFlags)
  (image VkImage)
  (viewType VkImageViewType)
  (format VkFormat)
  (components VkComponentMapping)
  (subresourceRange VkImageSubresourceRange))

(cffi:defcstruct VkShaderModuleCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkShaderModuleCreateFlags)
  (codeSize :size)
  (pCode (:pointer :uint32)))

(cffi:defcstruct VkPipelineCacheCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCacheCreateFlags)
  (initialDataSize :size)
  (pInitialData (:pointer :void)))

(cffi:defcstruct VkSpecializationMapEntry 
  (constantID :uint32)
  (offset :uint32)
  (size :size))

(cffi:defcstruct VkSpecializationInfo 
  (mapEntryCount :uint32)
  (pMapEntries (:pointer VkSpecializationMapEntry))
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcstruct VkPipelineShaderStageCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineShaderStageCreateFlags)
  (stage VkShaderStageFlagBits)
  (module VkShaderModule)
  (pName (:pointer :char))
  (pSpecializationInfo (:pointer VkSpecializationInfo)))

(cffi:defcstruct VkComputePipelineCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCreateFlags)
  (stage VkPipelineShaderStageCreateInfo)
  (layout VkPipelineLayout)
  (basePipelineHandle VkPipeline)
  (basePipelineIndex :int32))

(cffi:defcstruct VkVertexInputBindingDescription 
  (binding :uint32)
  (stride :uint32)
  (inputRate VkVertexInputRate))

(cffi:defcstruct VkVertexInputAttributeDescription 
  (location :uint32)
  (binding :uint32)
  (format VkFormat)
  (offset :uint32))

(cffi:defcstruct VkPipelineVertexInputStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineVertexInputStateCreateFlags)
  (vertexBindingDescriptionCount :uint32)
  (pVertexBindingDescriptions (:pointer VkVertexInputBindingDescription))
  (vertexAttributeDescriptionCount :uint32)
  (pVertexAttributeDescriptions (:pointer VkVertexInputAttributeDescription)))

(cffi:defcstruct VkPipelineInputAssemblyStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineInputAssemblyStateCreateFlags)
  (topology VkPrimitiveTopology)
  (primitiveRestartEnable VkBool32))

(cffi:defcstruct VkPipelineTessellationStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineTessellationStateCreateFlags)
  (patchControlPoints :uint32))

(cffi:defcstruct VkViewport 
  (x :float)
  (y :float)
  (width :float)
  (height :float)
  (minDepth :float)
  (maxDepth :float))

(cffi:defcstruct VkPipelineViewportStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineViewportStateCreateFlags)
  (viewportCount :uint32)
  (pViewports (:pointer VkViewport))
  (scissorCount :uint32)
  (pScissors (:pointer VkRect2D)))

(cffi:defcstruct VkPipelineRasterizationStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineRasterizationStateCreateFlags)
  (depthClampEnable VkBool32)
  (rasterizerDiscardEnable VkBool32)
  (polygonMode VkPolygonMode)
  (cullMode VkCullModeFlags)
  (frontFace VkFrontFace)
  (depthBiasEnable VkBool32)
  (depthBiasConstantFactor :float)
  (depthBiasClamp :float)
  (depthBiasSlopeFactor :float)
  (lineWidth :float))

(cffi:defcstruct VkPipelineMultisampleStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineMultisampleStateCreateFlags)
  (rasterizationSamples VkSampleCountFlagBits)
  (sampleShadingEnable VkBool32)
  (minSampleShading :float)
  (pSampleMask (:pointer VkSampleMask))
  (alphaToCoverageEnable VkBool32)
  (alphaToOneEnable VkBool32))

(cffi:defcstruct VkStencilOpState 
  (failOp VkStencilOp)
  (passOp VkStencilOp)
  (depthFailOp VkStencilOp)
  (compareOp VkCompareOp)
  (compareMask :uint32)
  (writeMask :uint32)
  (reference :uint32))

(cffi:defcstruct VkPipelineDepthStencilStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineDepthStencilStateCreateFlags)
  (depthTestEnable VkBool32)
  (depthWriteEnable VkBool32)
  (depthCompareOp VkCompareOp)
  (depthBoundsTestEnable VkBool32)
  (stencilTestEnable VkBool32)
  (front VkStencilOpState)
  (back VkStencilOpState)
  (minDepthBounds :float)
  (maxDepthBounds :float))

(cffi:defcstruct VkPipelineColorBlendAttachmentState 
  (blendEnable VkBool32)
  (srcColorBlendFactor VkBlendFactor)
  (dstColorBlendFactor VkBlendFactor)
  (colorBlendOp VkBlendOp)
  (srcAlphaBlendFactor VkBlendFactor)
  (dstAlphaBlendFactor VkBlendFactor)
  (alphaBlendOp VkBlendOp)
  (colorWriteMask VkColorComponentFlags))

(cffi:defcstruct VkPipelineColorBlendStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineColorBlendStateCreateFlags)
  (logicOpEnable VkBool32)
  (logicOp VkLogicOp)
  (attachmentCount :uint32)
  (pAttachments (:pointer VkPipelineColorBlendAttachmentState))
  (blendConstants :float :count 4))

(cffi:defcstruct VkPipelineDynamicStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineDynamicStateCreateFlags)
  (dynamicStateCount :uint32)
  (pDynamicStates (:pointer VkDynamicState)))

(cffi:defcstruct VkGraphicsPipelineCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCreateFlags)
  (stageCount :uint32)
  (pStages (:pointer VkPipelineShaderStageCreateInfo))
  (pVertexInputState (:pointer VkPipelineVertexInputStateCreateInfo))
  (pInputAssemblyState (:pointer VkPipelineInputAssemblyStateCreateInfo))
  (pTessellationState (:pointer VkPipelineTessellationStateCreateInfo))
  (pViewportState (:pointer VkPipelineViewportStateCreateInfo))
  (pRasterizationState (:pointer VkPipelineRasterizationStateCreateInfo))
  (pMultisampleState (:pointer VkPipelineMultisampleStateCreateInfo))
  (pDepthStencilState (:pointer VkPipelineDepthStencilStateCreateInfo))
  (pColorBlendState (:pointer VkPipelineColorBlendStateCreateInfo))
  (pDynamicState (:pointer VkPipelineDynamicStateCreateInfo))
  (layout VkPipelineLayout)
  (renderPass VkRenderPass)
  (subpass :uint32)
  (basePipelineHandle VkPipeline)
  (basePipelineIndex :int32))

(cffi:defcstruct VkPushConstantRange 
  (stageFlags VkShaderStageFlags)
  (offset :uint32)
  (size :uint32))

(cffi:defcstruct VkPipelineLayoutCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineLayoutCreateFlags)
  (setLayoutCount :uint32)
  (pSetLayouts (:pointer VkDescriptorSetLayout))
  (pushConstantRangeCount :uint32)
  (pPushConstantRanges (:pointer VkPushConstantRange)))

(cffi:defcstruct VkSamplerCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkSamplerCreateFlags)
  (magFilter VkFilter)
  (minFilter VkFilter)
  (mipmapMode VkSamplerMipmapMode)
  (addressModeU VkSamplerAddressMode)
  (addressModeV VkSamplerAddressMode)
  (addressModeW VkSamplerAddressMode)
  (mipLodBias :float)
  (anisotropyEnable VkBool32)
  (maxAnisotropy :float)
  (compareEnable VkBool32)
  (compareOp VkCompareOp)
  (minLod :float)
  (maxLod :float)
  (borderColor VkBorderColor)
  (unnormalizedCoordinates VkBool32))

(cffi:defcstruct VkCopyDescriptorSet 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcSet VkDescriptorSet)
  (srcBinding :uint32)
  (srcArrayElement :uint32)
  (dstSet VkDescriptorSet)
  (dstBinding :uint32)
  (dstArrayElement :uint32)
  (descriptorCount :uint32))

(cffi:defcstruct VkDescriptorBufferInfo 
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (range VkDeviceSize))

(cffi:defcstruct VkDescriptorImageInfo 
  (sampler VkSampler)
  (imageView VkImageView)
  (imageLayout VkImageLayout))

(cffi:defcstruct VkDescriptorPoolSize 
  (type VkDescriptorType)
  (descriptorCount :uint32))

(cffi:defcstruct VkDescriptorPoolCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDescriptorPoolCreateFlags)
  (maxSets :uint32)
  (poolSizeCount :uint32)
  (pPoolSizes (:pointer VkDescriptorPoolSize)))

(cffi:defcstruct VkDescriptorSetAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (descriptorPool VkDescriptorPool)
  (descriptorSetCount :uint32)
  (pSetLayouts (:pointer VkDescriptorSetLayout)))

(cffi:defcstruct VkDescriptorSetLayoutBinding 
  (binding :uint32)
  (descriptorType VkDescriptorType)
  (descriptorCount :uint32)
  (stageFlags VkShaderStageFlags)
  (pImmutableSamplers (:pointer VkSampler)))

(cffi:defcstruct VkDescriptorSetLayoutCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDescriptorSetLayoutCreateFlags)
  (bindingCount :uint32)
  (pBindings (:pointer VkDescriptorSetLayoutBinding)))

(cffi:defcstruct VkWriteDescriptorSet 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dstSet VkDescriptorSet)
  (dstBinding :uint32)
  (dstArrayElement :uint32)
  (descriptorCount :uint32)
  (descriptorType VkDescriptorType)
  (pImageInfo (:pointer VkDescriptorImageInfo))
  (pBufferInfo (:pointer VkDescriptorBufferInfo))
  (pTexelBufferView (:pointer VkBufferView)))

(cffi:defcstruct VkAttachmentDescription 
  (flags VkAttachmentDescriptionFlags)
  (format VkFormat)
  (samples VkSampleCountFlagBits)
  (loadOp VkAttachmentLoadOp)
  (storeOp VkAttachmentStoreOp)
  (stencilLoadOp VkAttachmentLoadOp)
  (stencilStoreOp VkAttachmentStoreOp)
  (initialLayout VkImageLayout)
  (finalLayout VkImageLayout))

(cffi:defcstruct VkAttachmentReference 
  (attachment :uint32)
  (layout VkImageLayout))

(cffi:defcstruct VkFramebufferCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkFramebufferCreateFlags)
  (renderPass VkRenderPass)
  (attachmentCount :uint32)
  (pAttachments (:pointer VkImageView))
  (width :uint32)
  (height :uint32)
  (layers :uint32))

(cffi:defcstruct VkSubpassDescription 
  (flags VkSubpassDescriptionFlags)
  (pipelineBindPoint VkPipelineBindPoint)
  (inputAttachmentCount :uint32)
  (pInputAttachments (:pointer VkAttachmentReference))
  (colorAttachmentCount :uint32)
  (pColorAttachments (:pointer VkAttachmentReference))
  (pResolveAttachments (:pointer VkAttachmentReference))
  (pDepthStencilAttachment (:pointer VkAttachmentReference))
  (preserveAttachmentCount :uint32)
  (pPreserveAttachments (:pointer :uint32)))

(cffi:defcstruct VkSubpassDependency 
  (srcSubpass :uint32)
  (dstSubpass :uint32)
  (srcStageMask VkPipelineStageFlags)
  (dstStageMask VkPipelineStageFlags)
  (srcAccessMask VkAccessFlags)
  (dstAccessMask VkAccessFlags)
  (dependencyFlags VkDependencyFlags))

(cffi:defcstruct VkRenderPassCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkRenderPassCreateFlags)
  (attachmentCount :uint32)
  (pAttachments (:pointer VkAttachmentDescription))
  (subpassCount :uint32)
  (pSubpasses (:pointer VkSubpassDescription))
  (dependencyCount :uint32)
  (pDependencies (:pointer VkSubpassDependency)))

(cffi:defcstruct VkCommandPoolCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkCommandPoolCreateFlags)
  (queueFamilyIndex :uint32))

(cffi:defcstruct VkCommandBufferAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (commandPool VkCommandPool)
  (level VkCommandBufferLevel)
  (commandBufferCount :uint32))

(cffi:defcstruct VkCommandBufferInheritanceInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (renderPass VkRenderPass)
  (subpass :uint32)
  (framebuffer VkFramebuffer)
  (occlusionQueryEnable VkBool32)
  (queryFlags VkQueryControlFlags)
  (pipelineStatistics VkQueryPipelineStatisticFlags))

(cffi:defcstruct VkCommandBufferBeginInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkCommandBufferUsageFlags)
  (pInheritanceInfo (:pointer VkCommandBufferInheritanceInfo)))

(cffi:defcstruct VkBufferCopy 
  (srcOffset VkDeviceSize)
  (dstOffset VkDeviceSize)
  (size VkDeviceSize))

(cffi:defcstruct VkImageSubresourceLayers 
  (aspectMask VkImageAspectFlags)
  (mipLevel :uint32)
  (baseArrayLayer :uint32)
  (layerCount :uint32))

(cffi:defcstruct VkBufferImageCopy 
  (bufferOffset VkDeviceSize)
  (bufferRowLength :uint32)
  (bufferImageHeight :uint32)
  (imageSubresource VkImageSubresourceLayers)
  (imageOffset VkOffset3D)
  (imageExtent VkExtent3D))

(cffi:defcstruct VkClearDepthStencilValue 
  (depth :float)
  (stencil :uint32))

(cffi:defcstruct VkClearAttachment 
  (aspectMask VkImageAspectFlags)
  (colorAttachment :uint32)
  (clearValue VkClearValue))

(cffi:defcstruct VkClearRect 
  (rect VkRect2D)
  (baseArrayLayer :uint32)
  (layerCount :uint32))

(cffi:defcstruct VkImageBlit 
  (srcSubresource VkImageSubresourceLayers)
  (srcOffsets VkOffset3D :count 2)
  (dstSubresource VkImageSubresourceLayers)
  (dstOffsets VkOffset3D :count 2))

(cffi:defcstruct VkImageCopy 
  (srcSubresource VkImageSubresourceLayers)
  (srcOffset VkOffset3D)
  (dstSubresource VkImageSubresourceLayers)
  (dstOffset VkOffset3D)
  (extent VkExtent3D))

(cffi:defcstruct VkImageResolve 
  (srcSubresource VkImageSubresourceLayers)
  (srcOffset VkOffset3D)
  (dstSubresource VkImageSubresourceLayers)
  (dstOffset VkOffset3D)
  (extent VkExtent3D))

(cffi:defcstruct VkRenderPassBeginInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (renderPass VkRenderPass)
  (framebuffer VkFramebuffer)
  (renderArea VkRect2D)
  (clearValueCount :uint32)
  (pClearValues (:pointer VkClearValue)))

(cffi:defcstruct VkPhysicalDeviceSubgroupProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subgroupSize :uint32)
  (supportedStages VkShaderStageFlags)
  (supportedOperations VkSubgroupFeatureFlags)
  (quadOperationsInAllStages VkBool32))

(cffi:defcstruct VkBindBufferMemoryInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (buffer VkBuffer)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize))

(cffi:defcstruct VkBindImageMemoryInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (image VkImage)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize))

(cffi:defcstruct VkPhysicalDevice16BitStorageFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (storageBuffer16BitAccess VkBool32)
  (uniformAndStorageBuffer16BitAccess VkBool32)
  (storagePushConstant16 VkBool32)
  (storageInputOutput16 VkBool32))

(cffi:defcstruct VkMemoryDedicatedRequirements 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (prefersDedicatedAllocation VkBool32)
  (requiresDedicatedAllocation VkBool32))

(cffi:defcstruct VkMemoryDedicatedAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (image VkImage)
  (buffer VkBuffer))

(cffi:defcstruct VkMemoryAllocateFlagsInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkMemoryAllocateFlags)
  (deviceMask :uint32))

(cffi:defcstruct VkDeviceGroupRenderPassBeginInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceMask :uint32)
  (deviceRenderAreaCount :uint32)
  (pDeviceRenderAreas (:pointer VkRect2D)))

(cffi:defcstruct VkDeviceGroupCommandBufferBeginInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceMask :uint32))

(cffi:defcstruct VkDeviceGroupSubmitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (waitSemaphoreCount :uint32)
  (pWaitSemaphoreDeviceIndices (:pointer :uint32))
  (commandBufferCount :uint32)
  (pCommandBufferDeviceMasks (:pointer :uint32))
  (signalSemaphoreCount :uint32)
  (pSignalSemaphoreDeviceIndices (:pointer :uint32)))

(cffi:defcstruct VkDeviceGroupBindSparseInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (resourceDeviceIndex :uint32)
  (memoryDeviceIndex :uint32))

(cffi:defcstruct VkBindBufferMemoryDeviceGroupInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceIndexCount :uint32)
  (pDeviceIndices (:pointer :uint32)))

(cffi:defcstruct VkBindImageMemoryDeviceGroupInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceIndexCount :uint32)
  (pDeviceIndices (:pointer :uint32))
  (splitInstanceBindRegionCount :uint32)
  (pSplitInstanceBindRegions (:pointer VkRect2D)))

(cffi:defcstruct VkPhysicalDeviceGroupProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (physicalDeviceCount :uint32)
  (physicalDevices VkPhysicalDevice :count VK_MAX_DEVICE_GROUP_SIZE)
  (subsetAllocation VkBool32))

(cffi:defcstruct VkDeviceGroupDeviceCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (physicalDeviceCount :uint32)
  (pPhysicalDevices (:pointer VkPhysicalDevice)))

(cffi:defcstruct VkBufferMemoryRequirementsInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (buffer VkBuffer))

(cffi:defcstruct VkImageMemoryRequirementsInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (image VkImage))

(cffi:defcstruct VkImageSparseMemoryRequirementsInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (image VkImage))

(cffi:defcstruct VkMemoryRequirements2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memoryRequirements VkMemoryRequirements))

(cffi:defcstruct VkSparseImageMemoryRequirements2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memoryRequirements VkSparseImageMemoryRequirements))

(cffi:defcstruct VkPhysicalDeviceFeatures2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (features VkPhysicalDeviceFeatures))

(cffi:defcstruct VkPhysicalDeviceProperties2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (properties VkPhysicalDeviceProperties))

(cffi:defcstruct VkFormatProperties2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (formatProperties VkFormatProperties))

(cffi:defcstruct VkImageFormatProperties2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageFormatProperties VkImageFormatProperties))

(cffi:defcstruct VkPhysicalDeviceImageFormatInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (format VkFormat)
  (type VkImageType)
  (tiling VkImageTiling)
  (usage VkImageUsageFlags)
  (flags VkImageCreateFlags))

(cffi:defcstruct VkQueueFamilyProperties2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (queueFamilyProperties VkQueueFamilyProperties))

(cffi:defcstruct VkPhysicalDeviceMemoryProperties2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memoryProperties VkPhysicalDeviceMemoryProperties))

(cffi:defcstruct VkSparseImageFormatProperties2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (properties VkSparseImageFormatProperties))

(cffi:defcstruct VkPhysicalDeviceSparseImageFormatInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (format VkFormat)
  (type VkImageType)
  (samples VkSampleCountFlagBits)
  (usage VkImageUsageFlags)
  (tiling VkImageTiling))

(cffi:defcstruct VkPhysicalDevicePointClippingProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pointClippingBehavior VkPointClippingBehavior))

(cffi:defcstruct VkInputAttachmentAspectReference 
  (subpass :uint32)
  (inputAttachmentIndex :uint32)
  (aspectMask VkImageAspectFlags))

(cffi:defcstruct VkRenderPassInputAttachmentAspectCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (aspectReferenceCount :uint32)
  (pAspectReferences (:pointer VkInputAttachmentAspectReference)))

(cffi:defcstruct VkImageViewUsageCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (usage VkImageUsageFlags))

(cffi:defcstruct VkPipelineTessellationDomainOriginStateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (domainOrigin VkTessellationDomainOrigin))

(cffi:defcstruct VkRenderPassMultiviewCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subpassCount :uint32)
  (pViewMasks (:pointer :uint32))
  (dependencyCount :uint32)
  (pViewOffsets (:pointer :int32))
  (correlationMaskCount :uint32)
  (pCorrelationMasks (:pointer :uint32)))

(cffi:defcstruct VkPhysicalDeviceMultiviewFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (multiview VkBool32)
  (multiviewGeometryShader VkBool32)
  (multiviewTessellationShader VkBool32))

(cffi:defcstruct VkPhysicalDeviceMultiviewProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxMultiviewViewCount :uint32)
  (maxMultiviewInstanceIndex :uint32))

(cffi:defcstruct VkPhysicalDeviceVariablePointersFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (variablePointersStorageBuffer VkBool32)
  (variablePointers VkBool32))

(cffi:defcstruct VkPhysicalDeviceProtectedMemoryFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (protectedMemory VkBool32))

(cffi:defcstruct VkPhysicalDeviceProtectedMemoryProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (protectedNoFault VkBool32))

(cffi:defcstruct VkDeviceQueueInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDeviceQueueCreateFlags)
  (queueFamilyIndex :uint32)
  (queueIndex :uint32))

(cffi:defcstruct VkProtectedSubmitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (protectedSubmit VkBool32))

(cffi:defcstruct VkSamplerYcbcrConversionCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (format VkFormat)
  (ycbcrModel VkSamplerYcbcrModelConversion)
  (ycbcrRange VkSamplerYcbcrRange)
  (components VkComponentMapping)
  (xChromaOffset VkChromaLocation)
  (yChromaOffset VkChromaLocation)
  (chromaFilter VkFilter)
  (forceExplicitReconstruction VkBool32))

(cffi:defcstruct VkSamplerYcbcrConversionInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (conversion VkSamplerYcbcrConversion))

(cffi:defcstruct VkBindImagePlaneMemoryInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (planeAspect VkImageAspectFlagBits))

(cffi:defcstruct VkImagePlaneMemoryRequirementsInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (planeAspect VkImageAspectFlagBits))

(cffi:defcstruct VkPhysicalDeviceSamplerYcbcrConversionFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (samplerYcbcrConversion VkBool32))

(cffi:defcstruct VkSamplerYcbcrConversionImageFormatProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (combinedImageSamplerDescriptorCount :uint32))

(cffi:defcstruct VkDescriptorUpdateTemplateEntry 
  (dstBinding :uint32)
  (dstArrayElement :uint32)
  (descriptorCount :uint32)
  (descriptorType VkDescriptorType)
  (offset :size)
  (stride :size))

(cffi:defcstruct VkDescriptorUpdateTemplateCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDescriptorUpdateTemplateCreateFlags)
  (descriptorUpdateEntryCount :uint32)
  (pDescriptorUpdateEntries (:pointer VkDescriptorUpdateTemplateEntry))
  (templateType VkDescriptorUpdateTemplateType)
  (descriptorSetLayout VkDescriptorSetLayout)
  (pipelineBindPoint VkPipelineBindPoint)
  (pipelineLayout VkPipelineLayout)
  (set :uint32))

(cffi:defcstruct VkExternalMemoryProperties 
  (externalMemoryFeatures VkExternalMemoryFeatureFlags)
  (exportFromImportedHandleTypes VkExternalMemoryHandleTypeFlags)
  (compatibleHandleTypes VkExternalMemoryHandleTypeFlags))

(cffi:defcstruct VkPhysicalDeviceExternalImageFormatInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleType VkExternalMemoryHandleTypeFlagBits))

(cffi:defcstruct VkExternalImageFormatProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (externalMemoryProperties VkExternalMemoryProperties))

(cffi:defcstruct VkPhysicalDeviceExternalBufferInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkBufferCreateFlags)
  (usage VkBufferUsageFlags)
  (handleType VkExternalMemoryHandleTypeFlagBits))

(cffi:defcstruct VkExternalBufferProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (externalMemoryProperties VkExternalMemoryProperties))

(cffi:defcstruct VkPhysicalDeviceIDProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceUUID :uint8 :count VK_UUID_SIZE)
  (driverUUID :uint8 :count VK_UUID_SIZE)
  (deviceLUID :uint8 :count VK_LUID_SIZE)
  (deviceNodeMask :uint32)
  (deviceLUIDValid VkBool32))

(cffi:defcstruct VkExternalMemoryImageCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalMemoryHandleTypeFlags))

(cffi:defcstruct VkExternalMemoryBufferCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalMemoryHandleTypeFlags))

(cffi:defcstruct VkExportMemoryAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalMemoryHandleTypeFlags))

(cffi:defcstruct VkPhysicalDeviceExternalFenceInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleType VkExternalFenceHandleTypeFlagBits))

(cffi:defcstruct VkExternalFenceProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (exportFromImportedHandleTypes VkExternalFenceHandleTypeFlags)
  (compatibleHandleTypes VkExternalFenceHandleTypeFlags)
  (externalFenceFeatures VkExternalFenceFeatureFlags))

(cffi:defcstruct VkExportFenceCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalFenceHandleTypeFlags))

(cffi:defcstruct VkExportSemaphoreCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalSemaphoreHandleTypeFlags))

(cffi:defcstruct VkPhysicalDeviceExternalSemaphoreInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleType VkExternalSemaphoreHandleTypeFlagBits))

(cffi:defcstruct VkExternalSemaphoreProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (exportFromImportedHandleTypes VkExternalSemaphoreHandleTypeFlags)
  (compatibleHandleTypes VkExternalSemaphoreHandleTypeFlags)
  (externalSemaphoreFeatures VkExternalSemaphoreFeatureFlags))

(cffi:defcstruct VkPhysicalDeviceMaintenance3Properties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxPerSetDescriptors :uint32)
  (maxMemoryAllocationSize VkDeviceSize))

(cffi:defcstruct VkDescriptorSetLayoutSupport 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (supported VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderDrawParametersFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderDrawParameters VkBool32))

(cffi:defcstruct VkPhysicalDeviceVulkan11Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (storageBuffer16BitAccess VkBool32)
  (uniformAndStorageBuffer16BitAccess VkBool32)
  (storagePushConstant16 VkBool32)
  (storageInputOutput16 VkBool32)
  (multiview VkBool32)
  (multiviewGeometryShader VkBool32)
  (multiviewTessellationShader VkBool32)
  (variablePointersStorageBuffer VkBool32)
  (variablePointers VkBool32)
  (protectedMemory VkBool32)
  (samplerYcbcrConversion VkBool32)
  (shaderDrawParameters VkBool32))

(cffi:defcstruct VkPhysicalDeviceVulkan11Properties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceUUID :uint8 :count VK_UUID_SIZE)
  (driverUUID :uint8 :count VK_UUID_SIZE)
  (deviceLUID :uint8 :count VK_LUID_SIZE)
  (deviceNodeMask :uint32)
  (deviceLUIDValid VkBool32)
  (subgroupSize :uint32)
  (subgroupSupportedStages VkShaderStageFlags)
  (subgroupSupportedOperations VkSubgroupFeatureFlags)
  (subgroupQuadOperationsInAllStages VkBool32)
  (pointClippingBehavior VkPointClippingBehavior)
  (maxMultiviewViewCount :uint32)
  (maxMultiviewInstanceIndex :uint32)
  (protectedNoFault VkBool32)
  (maxPerSetDescriptors :uint32)
  (maxMemoryAllocationSize VkDeviceSize))

(cffi:defcstruct VkPhysicalDeviceVulkan12Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (samplerMirrorClampToEdge VkBool32)
  (drawIndirectCount VkBool32)
  (storageBuffer8BitAccess VkBool32)
  (uniformAndStorageBuffer8BitAccess VkBool32)
  (storagePushConstant8 VkBool32)
  (shaderBufferInt64Atomics VkBool32)
  (shaderSharedInt64Atomics VkBool32)
  (shaderFloat16 VkBool32)
  (shaderInt8 VkBool32)
  (descriptorIndexing VkBool32)
  (shaderInputAttachmentArrayDynamicIndexing VkBool32)
  (shaderUniformTexelBufferArrayDynamicIndexing VkBool32)
  (shaderStorageTexelBufferArrayDynamicIndexing VkBool32)
  (shaderUniformBufferArrayNonUniformIndexing VkBool32)
  (shaderSampledImageArrayNonUniformIndexing VkBool32)
  (shaderStorageBufferArrayNonUniformIndexing VkBool32)
  (shaderStorageImageArrayNonUniformIndexing VkBool32)
  (shaderInputAttachmentArrayNonUniformIndexing VkBool32)
  (shaderUniformTexelBufferArrayNonUniformIndexing VkBool32)
  (shaderStorageTexelBufferArrayNonUniformIndexing VkBool32)
  (descriptorBindingUniformBufferUpdateAfterBind VkBool32)
  (descriptorBindingSampledImageUpdateAfterBind VkBool32)
  (descriptorBindingStorageImageUpdateAfterBind VkBool32)
  (descriptorBindingStorageBufferUpdateAfterBind VkBool32)
  (descriptorBindingUniformTexelBufferUpdateAfterBind VkBool32)
  (descriptorBindingStorageTexelBufferUpdateAfterBind VkBool32)
  (descriptorBindingUpdateUnusedWhilePending VkBool32)
  (descriptorBindingPartiallyBound VkBool32)
  (descriptorBindingVariableDescriptorCount VkBool32)
  (runtimeDescriptorArray VkBool32)
  (samplerFilterMinmax VkBool32)
  (scalarBlockLayout VkBool32)
  (imagelessFramebuffer VkBool32)
  (uniformBufferStandardLayout VkBool32)
  (shaderSubgroupExtendedTypes VkBool32)
  (separateDepthStencilLayouts VkBool32)
  (hostQueryReset VkBool32)
  (timelineSemaphore VkBool32)
  (bufferDeviceAddress VkBool32)
  (bufferDeviceAddressCaptureReplay VkBool32)
  (bufferDeviceAddressMultiDevice VkBool32)
  (vulkanMemoryModel VkBool32)
  (vulkanMemoryModelDeviceScope VkBool32)
  (vulkanMemoryModelAvailabilityVisibilityChains VkBool32)
  (shaderOutputViewportIndex VkBool32)
  (shaderOutputLayer VkBool32)
  (subgroupBroadcastDynamicId VkBool32))

(cffi:defcstruct VkConformanceVersion 
  (major :uint8)
  (minor :uint8)
  (subminor :uint8)
  (patch :uint8))

(cffi:defcstruct VkPhysicalDeviceVulkan12Properties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (driverID VkDriverId)
  (driverName :char :count VK_MAX_DRIVER_NAME_SIZE)
  (driverInfo :char :count VK_MAX_DRIVER_INFO_SIZE)
  (conformanceVersion VkConformanceVersion)
  (denormBehaviorIndependence VkShaderFloatControlsIndependence)
  (roundingModeIndependence VkShaderFloatControlsIndependence)
  (shaderSignedZeroInfNanPreserveFloat16 VkBool32)
  (shaderSignedZeroInfNanPreserveFloat32 VkBool32)
  (shaderSignedZeroInfNanPreserveFloat64 VkBool32)
  (shaderDenormPreserveFloat16 VkBool32)
  (shaderDenormPreserveFloat32 VkBool32)
  (shaderDenormPreserveFloat64 VkBool32)
  (shaderDenormFlushToZeroFloat16 VkBool32)
  (shaderDenormFlushToZeroFloat32 VkBool32)
  (shaderDenormFlushToZeroFloat64 VkBool32)
  (shaderRoundingModeRTEFloat16 VkBool32)
  (shaderRoundingModeRTEFloat32 VkBool32)
  (shaderRoundingModeRTEFloat64 VkBool32)
  (shaderRoundingModeRTZFloat16 VkBool32)
  (shaderRoundingModeRTZFloat32 VkBool32)
  (shaderRoundingModeRTZFloat64 VkBool32)
  (maxUpdateAfterBindDescriptorsInAllPools :uint32)
  (shaderUniformBufferArrayNonUniformIndexingNative VkBool32)
  (shaderSampledImageArrayNonUniformIndexingNative VkBool32)
  (shaderStorageBufferArrayNonUniformIndexingNative VkBool32)
  (shaderStorageImageArrayNonUniformIndexingNative VkBool32)
  (shaderInputAttachmentArrayNonUniformIndexingNative VkBool32)
  (robustBufferAccessUpdateAfterBind VkBool32)
  (quadDivergentImplicitLod VkBool32)
  (maxPerStageDescriptorUpdateAfterBindSamplers :uint32)
  (maxPerStageDescriptorUpdateAfterBindUniformBuffers :uint32)
  (maxPerStageDescriptorUpdateAfterBindStorageBuffers :uint32)
  (maxPerStageDescriptorUpdateAfterBindSampledImages :uint32)
  (maxPerStageDescriptorUpdateAfterBindStorageImages :uint32)
  (maxPerStageDescriptorUpdateAfterBindInputAttachments :uint32)
  (maxPerStageUpdateAfterBindResources :uint32)
  (maxDescriptorSetUpdateAfterBindSamplers :uint32)
  (maxDescriptorSetUpdateAfterBindUniformBuffers :uint32)
  (maxDescriptorSetUpdateAfterBindUniformBuffersDynamic :uint32)
  (maxDescriptorSetUpdateAfterBindStorageBuffers :uint32)
  (maxDescriptorSetUpdateAfterBindStorageBuffersDynamic :uint32)
  (maxDescriptorSetUpdateAfterBindSampledImages :uint32)
  (maxDescriptorSetUpdateAfterBindStorageImages :uint32)
  (maxDescriptorSetUpdateAfterBindInputAttachments :uint32)
  (supportedDepthResolveModes VkResolveModeFlags)
  (supportedStencilResolveModes VkResolveModeFlags)
  (independentResolveNone VkBool32)
  (independentResolve VkBool32)
  (filterMinmaxSingleComponentFormats VkBool32)
  (filterMinmaxImageComponentMapping VkBool32)
  (maxTimelineSemaphoreValueDifference :uint64)
  (framebufferIntegerColorSampleCounts VkSampleCountFlags))

(cffi:defcstruct VkImageFormatListCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (viewFormatCount :uint32)
  (pViewFormats (:pointer VkFormat)))

(cffi:defcstruct VkAttachmentDescription2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkAttachmentDescriptionFlags)
  (format VkFormat)
  (samples VkSampleCountFlagBits)
  (loadOp VkAttachmentLoadOp)
  (storeOp VkAttachmentStoreOp)
  (stencilLoadOp VkAttachmentLoadOp)
  (stencilStoreOp VkAttachmentStoreOp)
  (initialLayout VkImageLayout)
  (finalLayout VkImageLayout))

(cffi:defcstruct VkAttachmentReference2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (attachment :uint32)
  (layout VkImageLayout)
  (aspectMask VkImageAspectFlags))

(cffi:defcstruct VkSubpassDescription2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkSubpassDescriptionFlags)
  (pipelineBindPoint VkPipelineBindPoint)
  (viewMask :uint32)
  (inputAttachmentCount :uint32)
  (pInputAttachments (:pointer VkAttachmentReference2))
  (colorAttachmentCount :uint32)
  (pColorAttachments (:pointer VkAttachmentReference2))
  (pResolveAttachments (:pointer VkAttachmentReference2))
  (pDepthStencilAttachment (:pointer VkAttachmentReference2))
  (preserveAttachmentCount :uint32)
  (pPreserveAttachments (:pointer :uint32)))

(cffi:defcstruct VkSubpassDependency2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcSubpass :uint32)
  (dstSubpass :uint32)
  (srcStageMask VkPipelineStageFlags)
  (dstStageMask VkPipelineStageFlags)
  (srcAccessMask VkAccessFlags)
  (dstAccessMask VkAccessFlags)
  (dependencyFlags VkDependencyFlags)
  (viewOffset :int32))

(cffi:defcstruct VkRenderPassCreateInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkRenderPassCreateFlags)
  (attachmentCount :uint32)
  (pAttachments (:pointer VkAttachmentDescription2))
  (subpassCount :uint32)
  (pSubpasses (:pointer VkSubpassDescription2))
  (dependencyCount :uint32)
  (pDependencies (:pointer VkSubpassDependency2))
  (correlatedViewMaskCount :uint32)
  (pCorrelatedViewMasks (:pointer :uint32)))

(cffi:defcstruct VkSubpassBeginInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (contents VkSubpassContents))

(cffi:defcstruct VkSubpassEndInfo 
  (sType VkStructureType)
  (pNext (:pointer :void)))

(cffi:defcstruct VkPhysicalDevice8BitStorageFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (storageBuffer8BitAccess VkBool32)
  (uniformAndStorageBuffer8BitAccess VkBool32)
  (storagePushConstant8 VkBool32))

(cffi:defcstruct VkPhysicalDeviceDriverProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (driverID VkDriverId)
  (driverName :char :count VK_MAX_DRIVER_NAME_SIZE)
  (driverInfo :char :count VK_MAX_DRIVER_INFO_SIZE)
  (conformanceVersion VkConformanceVersion))

(cffi:defcstruct VkPhysicalDeviceShaderAtomicInt64Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderBufferInt64Atomics VkBool32)
  (shaderSharedInt64Atomics VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderFloat16Int8Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderFloat16 VkBool32)
  (shaderInt8 VkBool32))

(cffi:defcstruct VkPhysicalDeviceFloatControlsProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (denormBehaviorIndependence VkShaderFloatControlsIndependence)
  (roundingModeIndependence VkShaderFloatControlsIndependence)
  (shaderSignedZeroInfNanPreserveFloat16 VkBool32)
  (shaderSignedZeroInfNanPreserveFloat32 VkBool32)
  (shaderSignedZeroInfNanPreserveFloat64 VkBool32)
  (shaderDenormPreserveFloat16 VkBool32)
  (shaderDenormPreserveFloat32 VkBool32)
  (shaderDenormPreserveFloat64 VkBool32)
  (shaderDenormFlushToZeroFloat16 VkBool32)
  (shaderDenormFlushToZeroFloat32 VkBool32)
  (shaderDenormFlushToZeroFloat64 VkBool32)
  (shaderRoundingModeRTEFloat16 VkBool32)
  (shaderRoundingModeRTEFloat32 VkBool32)
  (shaderRoundingModeRTEFloat64 VkBool32)
  (shaderRoundingModeRTZFloat16 VkBool32)
  (shaderRoundingModeRTZFloat32 VkBool32)
  (shaderRoundingModeRTZFloat64 VkBool32))

(cffi:defcstruct VkDescriptorSetLayoutBindingFlagsCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (bindingCount :uint32)
  (pBindingFlags (:pointer VkDescriptorBindingFlags)))

(cffi:defcstruct VkPhysicalDeviceDescriptorIndexingFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderInputAttachmentArrayDynamicIndexing VkBool32)
  (shaderUniformTexelBufferArrayDynamicIndexing VkBool32)
  (shaderStorageTexelBufferArrayDynamicIndexing VkBool32)
  (shaderUniformBufferArrayNonUniformIndexing VkBool32)
  (shaderSampledImageArrayNonUniformIndexing VkBool32)
  (shaderStorageBufferArrayNonUniformIndexing VkBool32)
  (shaderStorageImageArrayNonUniformIndexing VkBool32)
  (shaderInputAttachmentArrayNonUniformIndexing VkBool32)
  (shaderUniformTexelBufferArrayNonUniformIndexing VkBool32)
  (shaderStorageTexelBufferArrayNonUniformIndexing VkBool32)
  (descriptorBindingUniformBufferUpdateAfterBind VkBool32)
  (descriptorBindingSampledImageUpdateAfterBind VkBool32)
  (descriptorBindingStorageImageUpdateAfterBind VkBool32)
  (descriptorBindingStorageBufferUpdateAfterBind VkBool32)
  (descriptorBindingUniformTexelBufferUpdateAfterBind VkBool32)
  (descriptorBindingStorageTexelBufferUpdateAfterBind VkBool32)
  (descriptorBindingUpdateUnusedWhilePending VkBool32)
  (descriptorBindingPartiallyBound VkBool32)
  (descriptorBindingVariableDescriptorCount VkBool32)
  (runtimeDescriptorArray VkBool32))

(cffi:defcstruct VkPhysicalDeviceDescriptorIndexingProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxUpdateAfterBindDescriptorsInAllPools :uint32)
  (shaderUniformBufferArrayNonUniformIndexingNative VkBool32)
  (shaderSampledImageArrayNonUniformIndexingNative VkBool32)
  (shaderStorageBufferArrayNonUniformIndexingNative VkBool32)
  (shaderStorageImageArrayNonUniformIndexingNative VkBool32)
  (shaderInputAttachmentArrayNonUniformIndexingNative VkBool32)
  (robustBufferAccessUpdateAfterBind VkBool32)
  (quadDivergentImplicitLod VkBool32)
  (maxPerStageDescriptorUpdateAfterBindSamplers :uint32)
  (maxPerStageDescriptorUpdateAfterBindUniformBuffers :uint32)
  (maxPerStageDescriptorUpdateAfterBindStorageBuffers :uint32)
  (maxPerStageDescriptorUpdateAfterBindSampledImages :uint32)
  (maxPerStageDescriptorUpdateAfterBindStorageImages :uint32)
  (maxPerStageDescriptorUpdateAfterBindInputAttachments :uint32)
  (maxPerStageUpdateAfterBindResources :uint32)
  (maxDescriptorSetUpdateAfterBindSamplers :uint32)
  (maxDescriptorSetUpdateAfterBindUniformBuffers :uint32)
  (maxDescriptorSetUpdateAfterBindUniformBuffersDynamic :uint32)
  (maxDescriptorSetUpdateAfterBindStorageBuffers :uint32)
  (maxDescriptorSetUpdateAfterBindStorageBuffersDynamic :uint32)
  (maxDescriptorSetUpdateAfterBindSampledImages :uint32)
  (maxDescriptorSetUpdateAfterBindStorageImages :uint32)
  (maxDescriptorSetUpdateAfterBindInputAttachments :uint32))

(cffi:defcstruct VkDescriptorSetVariableDescriptorCountAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (descriptorSetCount :uint32)
  (pDescriptorCounts (:pointer :uint32)))

(cffi:defcstruct VkDescriptorSetVariableDescriptorCountLayoutSupport 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxVariableDescriptorCount :uint32))

(cffi:defcstruct VkSubpassDescriptionDepthStencilResolve 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (depthResolveMode VkResolveModeFlagBits)
  (stencilResolveMode VkResolveModeFlagBits)
  (pDepthStencilResolveAttachment (:pointer VkAttachmentReference2)))

(cffi:defcstruct VkPhysicalDeviceDepthStencilResolveProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (supportedDepthResolveModes VkResolveModeFlags)
  (supportedStencilResolveModes VkResolveModeFlags)
  (independentResolveNone VkBool32)
  (independentResolve VkBool32))

(cffi:defcstruct VkPhysicalDeviceScalarBlockLayoutFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (scalarBlockLayout VkBool32))

(cffi:defcstruct VkImageStencilUsageCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stencilUsage VkImageUsageFlags))

(cffi:defcstruct VkSamplerReductionModeCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (reductionMode VkSamplerReductionMode))

(cffi:defcstruct VkPhysicalDeviceSamplerFilterMinmaxProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (filterMinmaxSingleComponentFormats VkBool32)
  (filterMinmaxImageComponentMapping VkBool32))

(cffi:defcstruct VkPhysicalDeviceVulkanMemoryModelFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vulkanMemoryModel VkBool32)
  (vulkanMemoryModelDeviceScope VkBool32)
  (vulkanMemoryModelAvailabilityVisibilityChains VkBool32))

(cffi:defcstruct VkPhysicalDeviceImagelessFramebufferFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imagelessFramebuffer VkBool32))

(cffi:defcstruct VkFramebufferAttachmentImageInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkImageCreateFlags)
  (usage VkImageUsageFlags)
  (width :uint32)
  (height :uint32)
  (layerCount :uint32)
  (viewFormatCount :uint32)
  (pViewFormats (:pointer VkFormat)))

(cffi:defcstruct VkFramebufferAttachmentsCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (attachmentImageInfoCount :uint32)
  (pAttachmentImageInfos (:pointer VkFramebufferAttachmentImageInfo)))

(cffi:defcstruct VkRenderPassAttachmentBeginInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (attachmentCount :uint32)
  (pAttachments (:pointer VkImageView)))

(cffi:defcstruct VkPhysicalDeviceUniformBufferStandardLayoutFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (uniformBufferStandardLayout VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderSubgroupExtendedTypes VkBool32))

(cffi:defcstruct VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (separateDepthStencilLayouts VkBool32))

(cffi:defcstruct VkAttachmentReferenceStencilLayout 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stencilLayout VkImageLayout))

(cffi:defcstruct VkAttachmentDescriptionStencilLayout 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stencilInitialLayout VkImageLayout)
  (stencilFinalLayout VkImageLayout))

(cffi:defcstruct VkPhysicalDeviceHostQueryResetFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (hostQueryReset VkBool32))

(cffi:defcstruct VkPhysicalDeviceTimelineSemaphoreFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (timelineSemaphore VkBool32))

(cffi:defcstruct VkPhysicalDeviceTimelineSemaphoreProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxTimelineSemaphoreValueDifference :uint64))

(cffi:defcstruct VkSemaphoreTypeCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (semaphoreType VkSemaphoreType)
  (initialValue :uint64))

(cffi:defcstruct VkTimelineSemaphoreSubmitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (waitSemaphoreValueCount :uint32)
  (pWaitSemaphoreValues (:pointer :uint64))
  (signalSemaphoreValueCount :uint32)
  (pSignalSemaphoreValues (:pointer :uint64)))

(cffi:defcstruct VkSemaphoreWaitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkSemaphoreWaitFlags)
  (semaphoreCount :uint32)
  (pSemaphores (:pointer VkSemaphore))
  (pValues (:pointer :uint64)))

(cffi:defcstruct VkSemaphoreSignalInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (semaphore VkSemaphore)
  (value :uint64))

(cffi:defcstruct VkPhysicalDeviceBufferDeviceAddressFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (bufferDeviceAddress VkBool32)
  (bufferDeviceAddressCaptureReplay VkBool32)
  (bufferDeviceAddressMultiDevice VkBool32))

(cffi:defcstruct VkBufferDeviceAddressInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (buffer VkBuffer))

(cffi:defcstruct VkBufferOpaqueCaptureAddressCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (opaqueCaptureAddress :uint64))

(cffi:defcstruct VkMemoryOpaqueCaptureAddressAllocateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (opaqueCaptureAddress :uint64))

(cffi:defcstruct VkDeviceMemoryOpaqueCaptureAddressInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memory VkDeviceMemory))

(cffi:defcstruct VkPhysicalDeviceVulkan13Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (robustImageAccess VkBool32)
  (inlineUniformBlock VkBool32)
  (descriptorBindingInlineUniformBlockUpdateAfterBind VkBool32)
  (pipelineCreationCacheControl VkBool32)
  (privateData VkBool32)
  (shaderDemoteToHelperInvocation VkBool32)
  (shaderTerminateInvocation VkBool32)
  (subgroupSizeControl VkBool32)
  (computeFullSubgroups VkBool32)
  (synchronization2 VkBool32)
  (textureCompressionASTC_HDR VkBool32)
  (shaderZeroInitializeWorkgroupMemory VkBool32)
  (dynamicRendering VkBool32)
  (shaderIntegerDotProduct VkBool32)
  (maintenance4 VkBool32))

(cffi:defcstruct VkPhysicalDeviceVulkan13Properties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minSubgroupSize :uint32)
  (maxSubgroupSize :uint32)
  (maxComputeWorkgroupSubgroups :uint32)
  (requiredSubgroupSizeStages VkShaderStageFlags)
  (maxInlineUniformBlockSize :uint32)
  (maxPerStageDescriptorInlineUniformBlocks :uint32)
  (maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks :uint32)
  (maxDescriptorSetInlineUniformBlocks :uint32)
  (maxDescriptorSetUpdateAfterBindInlineUniformBlocks :uint32)
  (maxInlineUniformTotalSize :uint32)
  (integerDotProduct8BitUnsignedAccelerated VkBool32)
  (integerDotProduct8BitSignedAccelerated VkBool32)
  (integerDotProduct8BitMixedSignednessAccelerated VkBool32)
  (integerDotProduct4x8BitPackedUnsignedAccelerated VkBool32)
  (integerDotProduct4x8BitPackedSignedAccelerated VkBool32)
  (integerDotProduct4x8BitPackedMixedSignednessAccelerated VkBool32)
  (integerDotProduct16BitUnsignedAccelerated VkBool32)
  (integerDotProduct16BitSignedAccelerated VkBool32)
  (integerDotProduct16BitMixedSignednessAccelerated VkBool32)
  (integerDotProduct32BitUnsignedAccelerated VkBool32)
  (integerDotProduct32BitSignedAccelerated VkBool32)
  (integerDotProduct32BitMixedSignednessAccelerated VkBool32)
  (integerDotProduct64BitUnsignedAccelerated VkBool32)
  (integerDotProduct64BitSignedAccelerated VkBool32)
  (integerDotProduct64BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating8BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating8BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating16BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating16BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating32BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating32BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating64BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating64BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated VkBool32)
  (storageTexelBufferOffsetAlignmentBytes VkDeviceSize)
  (storageTexelBufferOffsetSingleTexelAlignment VkBool32)
  (uniformTexelBufferOffsetAlignmentBytes VkDeviceSize)
  (uniformTexelBufferOffsetSingleTexelAlignment VkBool32)
  (maxBufferSize VkDeviceSize))

(cffi:defcstruct VkPipelineCreationFeedback 
  (flags VkPipelineCreationFeedbackFlags)
  (duration :uint64))

(cffi:defcstruct VkPipelineCreationFeedbackCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pPipelineCreationFeedback (:pointer VkPipelineCreationFeedback))
  (pipelineStageCreationFeedbackCount :uint32)
  (pPipelineStageCreationFeedbacks (:pointer VkPipelineCreationFeedback)))

(cffi:defcstruct VkPhysicalDeviceShaderTerminateInvocationFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderTerminateInvocation VkBool32))

(cffi:defcstruct VkPhysicalDeviceToolProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (name :char :count VK_MAX_EXTENSION_NAME_SIZE)
  (version :char :count VK_MAX_EXTENSION_NAME_SIZE)
  (purposes VkToolPurposeFlags)
  (description :char :count VK_MAX_DESCRIPTION_SIZE)
  (layer :char :count VK_MAX_EXTENSION_NAME_SIZE))

(cffi:defcstruct VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderDemoteToHelperInvocation VkBool32))

(cffi:defcstruct VkPhysicalDevicePrivateDataFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (privateData VkBool32))

(cffi:defcstruct VkDevicePrivateDataCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (privateDataSlotRequestCount :uint32))

(cffi:defcstruct VkPrivateDataSlotCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPrivateDataSlotCreateFlags))

(cffi:defcstruct VkPhysicalDevicePipelineCreationCacheControlFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelineCreationCacheControl VkBool32))

(cffi:defcstruct VkMemoryBarrier2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcStageMask VkPipelineStageFlags2)
  (srcAccessMask VkAccessFlags2)
  (dstStageMask VkPipelineStageFlags2)
  (dstAccessMask VkAccessFlags2))

(cffi:defcstruct VkBufferMemoryBarrier2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcStageMask VkPipelineStageFlags2)
  (srcAccessMask VkAccessFlags2)
  (dstStageMask VkPipelineStageFlags2)
  (dstAccessMask VkAccessFlags2)
  (srcQueueFamilyIndex :uint32)
  (dstQueueFamilyIndex :uint32)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (size VkDeviceSize))

(cffi:defcstruct VkImageMemoryBarrier2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcStageMask VkPipelineStageFlags2)
  (srcAccessMask VkAccessFlags2)
  (dstStageMask VkPipelineStageFlags2)
  (dstAccessMask VkAccessFlags2)
  (oldLayout VkImageLayout)
  (newLayout VkImageLayout)
  (srcQueueFamilyIndex :uint32)
  (dstQueueFamilyIndex :uint32)
  (image VkImage)
  (subresourceRange VkImageSubresourceRange))

(cffi:defcstruct VkDependencyInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dependencyFlags VkDependencyFlags)
  (memoryBarrierCount :uint32)
  (pMemoryBarriers (:pointer VkMemoryBarrier2))
  (bufferMemoryBarrierCount :uint32)
  (pBufferMemoryBarriers (:pointer VkBufferMemoryBarrier2))
  (imageMemoryBarrierCount :uint32)
  (pImageMemoryBarriers (:pointer VkImageMemoryBarrier2)))

(cffi:defcstruct VkSemaphoreSubmitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (semaphore VkSemaphore)
  (value :uint64)
  (stageMask VkPipelineStageFlags2)
  (deviceIndex :uint32))

(cffi:defcstruct VkCommandBufferSubmitInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (commandBuffer VkCommandBuffer)
  (deviceMask :uint32))

(cffi:defcstruct VkSubmitInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkSubmitFlags)
  (waitSemaphoreInfoCount :uint32)
  (pWaitSemaphoreInfos (:pointer VkSemaphoreSubmitInfo))
  (commandBufferInfoCount :uint32)
  (pCommandBufferInfos (:pointer VkCommandBufferSubmitInfo))
  (signalSemaphoreInfoCount :uint32)
  (pSignalSemaphoreInfos (:pointer VkSemaphoreSubmitInfo)))

(cffi:defcstruct VkPhysicalDeviceSynchronization2Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (synchronization2 VkBool32))

(cffi:defcstruct VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderZeroInitializeWorkgroupMemory VkBool32))

(cffi:defcstruct VkPhysicalDeviceImageRobustnessFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (robustImageAccess VkBool32))

(cffi:defcstruct VkBufferCopy2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcOffset VkDeviceSize)
  (dstOffset VkDeviceSize)
  (size VkDeviceSize))

(cffi:defcstruct VkCopyBufferInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcBuffer VkBuffer)
  (dstBuffer VkBuffer)
  (regionCount :uint32)
  (pRegions (:pointer VkBufferCopy2)))

(cffi:defcstruct VkImageCopy2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcSubresource VkImageSubresourceLayers)
  (srcOffset VkOffset3D)
  (dstSubresource VkImageSubresourceLayers)
  (dstOffset VkOffset3D)
  (extent VkExtent3D))

(cffi:defcstruct VkCopyImageInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkImageCopy2)))

(cffi:defcstruct VkBufferImageCopy2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (bufferOffset VkDeviceSize)
  (bufferRowLength :uint32)
  (bufferImageHeight :uint32)
  (imageSubresource VkImageSubresourceLayers)
  (imageOffset VkOffset3D)
  (imageExtent VkExtent3D))

(cffi:defcstruct VkCopyBufferToImageInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcBuffer VkBuffer)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkBufferImageCopy2)))

(cffi:defcstruct VkCopyImageToBufferInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstBuffer VkBuffer)
  (regionCount :uint32)
  (pRegions (:pointer VkBufferImageCopy2)))

(cffi:defcstruct VkImageBlit2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcSubresource VkImageSubresourceLayers)
  (srcOffsets VkOffset3D :count 2)
  (dstSubresource VkImageSubresourceLayers)
  (dstOffsets VkOffset3D :count 2))

(cffi:defcstruct VkBlitImageInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkImageBlit2))
  (filter VkFilter))

(cffi:defcstruct VkImageResolve2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcSubresource VkImageSubresourceLayers)
  (srcOffset VkOffset3D)
  (dstSubresource VkImageSubresourceLayers)
  (dstOffset VkOffset3D)
  (extent VkExtent3D))

(cffi:defcstruct VkResolveImageInfo2 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcImage VkImage)
  (srcImageLayout VkImageLayout)
  (dstImage VkImage)
  (dstImageLayout VkImageLayout)
  (regionCount :uint32)
  (pRegions (:pointer VkImageResolve2)))

(cffi:defcstruct VkPhysicalDeviceSubgroupSizeControlFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subgroupSizeControl VkBool32)
  (computeFullSubgroups VkBool32))

(cffi:defcstruct VkPhysicalDeviceSubgroupSizeControlProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minSubgroupSize :uint32)
  (maxSubgroupSize :uint32)
  (maxComputeWorkgroupSubgroups :uint32)
  (requiredSubgroupSizeStages VkShaderStageFlags))

(cffi:defcstruct VkPipelineShaderStageRequiredSubgroupSizeCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (requiredSubgroupSize :uint32))

(cffi:defcstruct VkPhysicalDeviceInlineUniformBlockFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (inlineUniformBlock VkBool32)
  (descriptorBindingInlineUniformBlockUpdateAfterBind VkBool32))

(cffi:defcstruct VkPhysicalDeviceInlineUniformBlockProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxInlineUniformBlockSize :uint32)
  (maxPerStageDescriptorInlineUniformBlocks :uint32)
  (maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks :uint32)
  (maxDescriptorSetInlineUniformBlocks :uint32)
  (maxDescriptorSetUpdateAfterBindInlineUniformBlocks :uint32))

(cffi:defcstruct VkWriteDescriptorSetInlineUniformBlock 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dataSize :uint32)
  (pData (:pointer :void)))

(cffi:defcstruct VkDescriptorPoolInlineUniformBlockCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxInlineUniformBlockBindings :uint32))

(cffi:defcstruct VkPhysicalDeviceTextureCompressionASTCHDRFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (textureCompressionASTC_HDR VkBool32))

(cffi:defcstruct VkRenderingAttachmentInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageView VkImageView)
  (imageLayout VkImageLayout)
  (resolveMode VkResolveModeFlagBits)
  (resolveImageView VkImageView)
  (resolveImageLayout VkImageLayout)
  (loadOp VkAttachmentLoadOp)
  (storeOp VkAttachmentStoreOp)
  (clearValue VkClearValue))

(cffi:defcstruct VkRenderingInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkRenderingFlags)
  (renderArea VkRect2D)
  (layerCount :uint32)
  (viewMask :uint32)
  (colorAttachmentCount :uint32)
  (pColorAttachments (:pointer VkRenderingAttachmentInfo))
  (pDepthAttachment (:pointer VkRenderingAttachmentInfo))
  (pStencilAttachment (:pointer VkRenderingAttachmentInfo)))

(cffi:defcstruct VkPipelineRenderingCreateInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (viewMask :uint32)
  (colorAttachmentCount :uint32)
  (pColorAttachmentFormats (:pointer VkFormat))
  (depthAttachmentFormat VkFormat)
  (stencilAttachmentFormat VkFormat))

(cffi:defcstruct VkPhysicalDeviceDynamicRenderingFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dynamicRendering VkBool32))

(cffi:defcstruct VkCommandBufferInheritanceRenderingInfo 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkRenderingFlags)
  (viewMask :uint32)
  (colorAttachmentCount :uint32)
  (pColorAttachmentFormats (:pointer VkFormat))
  (depthAttachmentFormat VkFormat)
  (stencilAttachmentFormat VkFormat)
  (rasterizationSamples VkSampleCountFlagBits))

(cffi:defcstruct VkPhysicalDeviceShaderIntegerDotProductFeatures 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderIntegerDotProduct VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderIntegerDotProductProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (integerDotProduct8BitUnsignedAccelerated VkBool32)
  (integerDotProduct8BitSignedAccelerated VkBool32)
  (integerDotProduct8BitMixedSignednessAccelerated VkBool32)
  (integerDotProduct4x8BitPackedUnsignedAccelerated VkBool32)
  (integerDotProduct4x8BitPackedSignedAccelerated VkBool32)
  (integerDotProduct4x8BitPackedMixedSignednessAccelerated VkBool32)
  (integerDotProduct16BitUnsignedAccelerated VkBool32)
  (integerDotProduct16BitSignedAccelerated VkBool32)
  (integerDotProduct16BitMixedSignednessAccelerated VkBool32)
  (integerDotProduct32BitUnsignedAccelerated VkBool32)
  (integerDotProduct32BitSignedAccelerated VkBool32)
  (integerDotProduct32BitMixedSignednessAccelerated VkBool32)
  (integerDotProduct64BitUnsignedAccelerated VkBool32)
  (integerDotProduct64BitSignedAccelerated VkBool32)
  (integerDotProduct64BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating8BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating8BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating16BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating16BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating32BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating32BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating64BitUnsignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating64BitSignedAccelerated VkBool32)
  (integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated VkBool32))

(cffi:defcstruct VkPhysicalDeviceTexelBufferAlignmentProperties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (storageTexelBufferOffsetAlignmentBytes VkDeviceSize)
  (storageTexelBufferOffsetSingleTexelAlignment VkBool32)
  (uniformTexelBufferOffsetAlignmentBytes VkDeviceSize)
  (uniformTexelBufferOffsetSingleTexelAlignment VkBool32))

(cffi:defcstruct VkFormatProperties3 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (linearTilingFeatures VkFormatFeatureFlags2)
  (optimalTilingFeatures VkFormatFeatureFlags2)
  (bufferFeatures VkFormatFeatureFlags2))

(cffi:defcstruct VkPhysicalDeviceMaintenance4Features 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maintenance4 VkBool32))

(cffi:defcstruct VkPhysicalDeviceMaintenance4Properties 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxBufferSize VkDeviceSize))

(cffi:defcstruct VkDeviceBufferMemoryRequirements 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pCreateInfo (:pointer VkBufferCreateInfo)))

(cffi:defcstruct VkDeviceImageMemoryRequirements 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pCreateInfo (:pointer VkImageCreateInfo))
  (planeAspect VkImageAspectFlagBits))

(cffi:defcstruct VkSurfaceCapabilitiesKHR 
  (minImageCount :uint32)
  (maxImageCount :uint32)
  (currentExtent VkExtent2D)
  (minImageExtent VkExtent2D)
  (maxImageExtent VkExtent2D)
  (maxImageArrayLayers :uint32)
  (supportedTransforms VkSurfaceTransformFlagsKHR)
  (currentTransform VkSurfaceTransformFlagBitsKHR)
  (supportedCompositeAlpha VkCompositeAlphaFlagsKHR)
  (supportedUsageFlags VkImageUsageFlags))

(cffi:defcstruct VkSurfaceFormatKHR 
  (format VkFormat)
  (colorSpace VkColorSpaceKHR))

(cffi:defcstruct VkSwapchainCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkSwapchainCreateFlagsKHR)
  (surface VkSurfaceKHR)
  (minImageCount :uint32)
  (imageFormat VkFormat)
  (imageColorSpace VkColorSpaceKHR)
  (imageExtent VkExtent2D)
  (imageArrayLayers :uint32)
  (imageUsage VkImageUsageFlags)
  (imageSharingMode VkSharingMode)
  (queueFamilyIndexCount :uint32)
  (pQueueFamilyIndices (:pointer :uint32))
  (preTransform VkSurfaceTransformFlagBitsKHR)
  (compositeAlpha VkCompositeAlphaFlagBitsKHR)
  (presentMode VkPresentModeKHR)
  (clipped VkBool32)
  (oldSwapchain VkSwapchainKHR))

(cffi:defcstruct VkPresentInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (waitSemaphoreCount :uint32)
  (pWaitSemaphores (:pointer VkSemaphore))
  (swapchainCount :uint32)
  (pSwapchains (:pointer VkSwapchainKHR))
  (pImageIndices (:pointer :uint32))
  (pResults (:pointer VkResult)))

(cffi:defcstruct VkImageSwapchainCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchain VkSwapchainKHR))

(cffi:defcstruct VkBindImageMemorySwapchainInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchain VkSwapchainKHR)
  (imageIndex :uint32))

(cffi:defcstruct VkAcquireNextImageInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchain VkSwapchainKHR)
  (timeout :uint64)
  (semaphore VkSemaphore)
  (fence VkFence)
  (deviceMask :uint32))

(cffi:defcstruct VkDeviceGroupPresentCapabilitiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (presentMask :uint32 :count VK_MAX_DEVICE_GROUP_SIZE)
  (modes VkDeviceGroupPresentModeFlagsKHR))

(cffi:defcstruct VkDeviceGroupPresentInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchainCount :uint32)
  (pDeviceMasks (:pointer :uint32))
  (mode VkDeviceGroupPresentModeFlagBitsKHR))

(cffi:defcstruct VkDeviceGroupSwapchainCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (modes VkDeviceGroupPresentModeFlagsKHR))

(cffi:defcstruct VkDisplayModeParametersKHR 
  (visibleRegion VkExtent2D)
  (refreshRate :uint32))

(cffi:defcstruct VkDisplayModeCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDisplayModeCreateFlagsKHR)
  (parameters VkDisplayModeParametersKHR))

(cffi:defcstruct VkDisplayModePropertiesKHR 
  (displayMode VkDisplayModeKHR)
  (parameters VkDisplayModeParametersKHR))

(cffi:defcstruct VkDisplayPlaneCapabilitiesKHR 
  (supportedAlpha VkDisplayPlaneAlphaFlagsKHR)
  (minSrcPosition VkOffset2D)
  (maxSrcPosition VkOffset2D)
  (minSrcExtent VkExtent2D)
  (maxSrcExtent VkExtent2D)
  (minDstPosition VkOffset2D)
  (maxDstPosition VkOffset2D)
  (minDstExtent VkExtent2D)
  (maxDstExtent VkExtent2D))

(cffi:defcstruct VkDisplayPlanePropertiesKHR 
  (currentDisplay VkDisplayKHR)
  (currentStackIndex :uint32))

(cffi:defcstruct VkDisplayPropertiesKHR 
  (display VkDisplayKHR)
  (displayName (:pointer :char))
  (physicalDimensions VkExtent2D)
  (physicalResolution VkExtent2D)
  (supportedTransforms VkSurfaceTransformFlagsKHR)
  (planeReorderPossible VkBool32)
  (persistentContent VkBool32))

(cffi:defcstruct VkDisplaySurfaceCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDisplaySurfaceCreateFlagsKHR)
  (displayMode VkDisplayModeKHR)
  (planeIndex :uint32)
  (planeStackIndex :uint32)
  (transform VkSurfaceTransformFlagBitsKHR)
  (globalAlpha :float)
  (alphaMode VkDisplayPlaneAlphaFlagBitsKHR)
  (imageExtent VkExtent2D))

(cffi:defcstruct VkDisplayPresentInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcRect VkRect2D)
  (dstRect VkRect2D)
  (persistent VkBool32))

(cffi:defcstruct VkRenderingFragmentShadingRateAttachmentInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageView VkImageView)
  (imageLayout VkImageLayout)
  (shadingRateAttachmentTexelSize VkExtent2D))

(cffi:defcstruct VkRenderingFragmentDensityMapAttachmentInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageView VkImageView)
  (imageLayout VkImageLayout))

(cffi:defcstruct VkAttachmentSampleCountInfoAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (colorAttachmentCount :uint32)
  (pColorAttachmentSamples (:pointer VkSampleCountFlagBits))
  (depthStencilAttachmentSamples VkSampleCountFlagBits))

(cffi:defcstruct VkMultiviewPerViewAttributesInfoNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (perViewAttributes VkBool32)
  (perViewAttributesPositionXOnly VkBool32))

(cffi:defcstruct VkImportMemoryFdInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleType VkExternalMemoryHandleTypeFlagBits)
  (fd :int))

(cffi:defcstruct VkMemoryFdPropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memoryTypeBits :uint32))

(cffi:defcstruct VkMemoryGetFdInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memory VkDeviceMemory)
  (handleType VkExternalMemoryHandleTypeFlagBits))

(cffi:defcstruct VkImportSemaphoreFdInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (semaphore VkSemaphore)
  (flags VkSemaphoreImportFlags)
  (handleType VkExternalSemaphoreHandleTypeFlagBits)
  (fd :int))

(cffi:defcstruct VkSemaphoreGetFdInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (semaphore VkSemaphore)
  (handleType VkExternalSemaphoreHandleTypeFlagBits))

(cffi:defcstruct VkPhysicalDevicePushDescriptorPropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxPushDescriptors :uint32))

(cffi:defcstruct VkRectLayerKHR 
  (offset VkOffset2D)
  (extent VkExtent2D)
  (layer :uint32))

(cffi:defcstruct VkPresentRegionKHR 
  (rectangleCount :uint32)
  (pRectangles (:pointer VkRectLayerKHR)))

(cffi:defcstruct VkPresentRegionsKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchainCount :uint32)
  (pRegions (:pointer VkPresentRegionKHR)))

(cffi:defcstruct VkSharedPresentSurfaceCapabilitiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (sharedPresentSupportedUsageFlags VkImageUsageFlags))

(cffi:defcstruct VkImportFenceFdInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fence VkFence)
  (flags VkFenceImportFlags)
  (handleType VkExternalFenceHandleTypeFlagBits)
  (fd :int))

(cffi:defcstruct VkFenceGetFdInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fence VkFence)
  (handleType VkExternalFenceHandleTypeFlagBits))

(cffi:defcstruct VkPhysicalDevicePerformanceQueryFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (performanceCounterQueryPools VkBool32)
  (performanceCounterMultipleQueryPools VkBool32))

(cffi:defcstruct VkPhysicalDevicePerformanceQueryPropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (allowCommandBufferQueryCopies VkBool32))

(cffi:defcstruct VkPerformanceCounterKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (unit VkPerformanceCounterUnitKHR)
  (scope VkPerformanceCounterScopeKHR)
  (storage VkPerformanceCounterStorageKHR)
  (uuid :uint8 :count VK_UUID_SIZE))

(cffi:defcstruct VkPerformanceCounterDescriptionKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPerformanceCounterDescriptionFlagsKHR)
  (name :char :count VK_MAX_DESCRIPTION_SIZE)
  (category :char :count VK_MAX_DESCRIPTION_SIZE)
  (description :char :count VK_MAX_DESCRIPTION_SIZE))

(cffi:defcstruct VkQueryPoolPerformanceCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (queueFamilyIndex :uint32)
  (counterIndexCount :uint32)
  (pCounterIndices (:pointer :uint32)))

(cffi:defcstruct VkAcquireProfilingLockInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkAcquireProfilingLockFlagsKHR)
  (timeout :uint64))

(cffi:defcstruct VkPerformanceQuerySubmitInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (counterPassIndex :uint32))

(cffi:defcstruct VkPhysicalDeviceSurfaceInfo2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (surface VkSurfaceKHR))

(cffi:defcstruct VkSurfaceCapabilities2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (surfaceCapabilities VkSurfaceCapabilitiesKHR))

(cffi:defcstruct VkSurfaceFormat2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (surfaceFormat VkSurfaceFormatKHR))

(cffi:defcstruct VkDisplayProperties2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (displayProperties VkDisplayPropertiesKHR))

(cffi:defcstruct VkDisplayPlaneProperties2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (displayPlaneProperties VkDisplayPlanePropertiesKHR))

(cffi:defcstruct VkDisplayModeProperties2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (displayModeProperties VkDisplayModePropertiesKHR))

(cffi:defcstruct VkDisplayPlaneInfo2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (mode VkDisplayModeKHR)
  (planeIndex :uint32))

(cffi:defcstruct VkDisplayPlaneCapabilities2KHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (capabilities VkDisplayPlaneCapabilitiesKHR))

(cffi:defcstruct VkPhysicalDeviceShaderClockFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderSubgroupClock VkBool32)
  (shaderDeviceClock VkBool32))

(cffi:defcstruct VkDeviceQueueGlobalPriorityCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (globalPriority VkQueueGlobalPriorityKHR))

(cffi:defcstruct VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (globalPriorityQuery VkBool32))

(cffi:defcstruct VkQueueFamilyGlobalPriorityPropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (priorityCount :uint32)
  (priorities VkQueueGlobalPriorityKHR :count VK_MAX_GLOBAL_PRIORITY_SIZE_KHR))

(cffi:defcstruct VkFragmentShadingRateAttachmentInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pFragmentShadingRateAttachment (:pointer VkAttachmentReference2))
  (shadingRateAttachmentTexelSize VkExtent2D))

(cffi:defcstruct VkPipelineFragmentShadingRateStateCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentSize VkExtent2D)
  (combinerOps VkFragmentShadingRateCombinerOpKHR :count 2))

(cffi:defcstruct VkPhysicalDeviceFragmentShadingRateFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelineFragmentShadingRate VkBool32)
  (primitiveFragmentShadingRate VkBool32)
  (attachmentFragmentShadingRate VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentShadingRatePropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minFragmentShadingRateAttachmentTexelSize VkExtent2D)
  (maxFragmentShadingRateAttachmentTexelSize VkExtent2D)
  (maxFragmentShadingRateAttachmentTexelSizeAspectRatio :uint32)
  (primitiveFragmentShadingRateWithMultipleViewports VkBool32)
  (layeredShadingRateAttachments VkBool32)
  (fragmentShadingRateNonTrivialCombinerOps VkBool32)
  (maxFragmentSize VkExtent2D)
  (maxFragmentSizeAspectRatio :uint32)
  (maxFragmentShadingRateCoverageSamples :uint32)
  (maxFragmentShadingRateRasterizationSamples VkSampleCountFlagBits)
  (fragmentShadingRateWithShaderDepthStencilWrites VkBool32)
  (fragmentShadingRateWithSampleMask VkBool32)
  (fragmentShadingRateWithShaderSampleMask VkBool32)
  (fragmentShadingRateWithConservativeRasterization VkBool32)
  (fragmentShadingRateWithFragmentShaderInterlock VkBool32)
  (fragmentShadingRateWithCustomSampleLocations VkBool32)
  (fragmentShadingRateStrictMultiplyCombiner VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentShadingRateKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (sampleCounts VkSampleCountFlags)
  (fragmentSize VkExtent2D))

(cffi:defcstruct VkSurfaceProtectedCapabilitiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (supportsProtected VkBool32))

(cffi:defcstruct VkPhysicalDevicePresentWaitFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (presentWait VkBool32))

(cffi:defcstruct VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelineExecutableInfo VkBool32))

(cffi:defcstruct VkPipelineInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipeline VkPipeline))

(cffi:defcstruct VkPipelineExecutablePropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stages VkShaderStageFlags)
  (name :char :count VK_MAX_DESCRIPTION_SIZE)
  (description :char :count VK_MAX_DESCRIPTION_SIZE)
  (subgroupSize :uint32))

(cffi:defcstruct VkPipelineExecutableInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipeline VkPipeline)
  (executableIndex :uint32))

(cffi:defcstruct VkPipelineExecutableStatisticKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (name :char :count VK_MAX_DESCRIPTION_SIZE)
  (description :char :count VK_MAX_DESCRIPTION_SIZE)
  (format VkPipelineExecutableStatisticFormatKHR)
  (value VkPipelineExecutableStatisticValueKHR))

(cffi:defcstruct VkPipelineExecutableInternalRepresentationKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (name :char :count VK_MAX_DESCRIPTION_SIZE)
  (description :char :count VK_MAX_DESCRIPTION_SIZE)
  (isText VkBool32)
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcstruct VkPipelineLibraryCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (libraryCount :uint32)
  (pLibraries (:pointer VkPipeline)))

(cffi:defcstruct VkPresentIdKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchainCount :uint32)
  (pPresentIds (:pointer :uint64)))

(cffi:defcstruct VkPhysicalDevicePresentIdFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (presentId VkBool32))

(cffi:defcstruct VkQueueFamilyCheckpointProperties2NV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (checkpointExecutionStageMask VkPipelineStageFlags2))

(cffi:defcstruct VkCheckpointData2NV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stage VkPipelineStageFlags2)
  (pCheckpointMarker (:pointer :void)))

(cffi:defcstruct VkPhysicalDeviceFragmentShaderBarycentricFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentShaderBarycentric VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentShaderBarycentricPropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (triStripVertexOrderIndependentOfProvokingVertex VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderSubgroupUniformControlFlow VkBool32))

(cffi:defcstruct VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (workgroupMemoryExplicitLayout VkBool32)
  (workgroupMemoryExplicitLayoutScalarBlockLayout VkBool32)
  (workgroupMemoryExplicitLayout8BitAccess VkBool32)
  (workgroupMemoryExplicitLayout16BitAccess VkBool32))

(cffi:defcstruct VkPhysicalDeviceRayTracingMaintenance1FeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rayTracingMaintenance1 VkBool32)
  (rayTracingPipelineTraceRaysIndirect2 VkBool32))

(cffi:defcstruct VkTraceRaysIndirectCommand2KHR 
  (raygenShaderRecordAddress VkDeviceAddress)
  (raygenShaderRecordSize VkDeviceSize)
  (missShaderBindingTableAddress VkDeviceAddress)
  (missShaderBindingTableSize VkDeviceSize)
  (missShaderBindingTableStride VkDeviceSize)
  (hitShaderBindingTableAddress VkDeviceAddress)
  (hitShaderBindingTableSize VkDeviceSize)
  (hitShaderBindingTableStride VkDeviceSize)
  (callableShaderBindingTableAddress VkDeviceAddress)
  (callableShaderBindingTableSize VkDeviceSize)
  (callableShaderBindingTableStride VkDeviceSize)
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcstruct VkDebugReportCallbackCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDebugReportFlagsEXT)
  (pfnCallback :PFN_vkDebugReportCallbackEXT)
  (pUserData (:pointer :void)))

(cffi:defcstruct VkPipelineRasterizationStateRasterizationOrderAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rasterizationOrder VkRasterizationOrderAMD))

(cffi:defcstruct VkDebugMarkerObjectNameInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (objectType VkDebugReportObjectTypeEXT)
  (object :uint64)
  (pObjectName (:pointer :char)))

(cffi:defcstruct VkDebugMarkerObjectTagInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (objectType VkDebugReportObjectTypeEXT)
  (object :uint64)
  (tagName :uint64)
  (tagSize :size)
  (pTag (:pointer :void)))

(cffi:defcstruct VkDebugMarkerMarkerInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pMarkerName (:pointer :char))
  (color :float :count 4))

(cffi:defcstruct VkDedicatedAllocationImageCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dedicatedAllocation VkBool32))

(cffi:defcstruct VkDedicatedAllocationBufferCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dedicatedAllocation VkBool32))

(cffi:defcstruct VkDedicatedAllocationMemoryAllocateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (image VkImage)
  (buffer VkBuffer))

(cffi:defcstruct VkPhysicalDeviceTransformFeedbackFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (transformFeedback VkBool32)
  (geometryStreams VkBool32))

(cffi:defcstruct VkPhysicalDeviceTransformFeedbackPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxTransformFeedbackStreams :uint32)
  (maxTransformFeedbackBuffers :uint32)
  (maxTransformFeedbackBufferSize VkDeviceSize)
  (maxTransformFeedbackStreamDataSize :uint32)
  (maxTransformFeedbackBufferDataSize :uint32)
  (maxTransformFeedbackBufferDataStride :uint32)
  (transformFeedbackQueries VkBool32)
  (transformFeedbackStreamsLinesTriangles VkBool32)
  (transformFeedbackRasterizationStreamSelect VkBool32)
  (transformFeedbackDraw VkBool32))

(cffi:defcstruct VkPipelineRasterizationStateStreamCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineRasterizationStateStreamCreateFlagsEXT)
  (rasterizationStream :uint32))

(cffi:defcstruct VkCuModuleCreateInfoNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dataSize :size)
  (pData (:pointer :void)))

(cffi:defcstruct VkCuFunctionCreateInfoNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (module VkCuModuleNVX)
  (pName (:pointer :char)))

(cffi:defcstruct VkCuLaunchInfoNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (function VkCuFunctionNVX)
  (gridDimX :uint32)
  (gridDimY :uint32)
  (gridDimZ :uint32)
  (blockDimX :uint32)
  (blockDimY :uint32)
  (blockDimZ :uint32)
  (sharedMemBytes :uint32)
  (paramCount :size)
  (pParams (:pointer :void))
  (extraCount :size)
  (pExtras (:pointer :void)))

(cffi:defcstruct VkImageViewHandleInfoNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageView VkImageView)
  (descriptorType VkDescriptorType)
  (sampler VkSampler))

(cffi:defcstruct VkImageViewAddressPropertiesNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceAddress VkDeviceAddress)
  (size VkDeviceSize))

(cffi:defcstruct VkTextureLODGatherFormatPropertiesAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (supportsTextureGatherLODBiasAMD VkBool32))

(cffi:defcstruct VkShaderResourceUsageAMD 
  (numUsedVgprs :uint32)
  (numUsedSgprs :uint32)
  (ldsSizePerLocalWorkGroup :uint32)
  (ldsUsageSizeInBytes :size)
  (scratchMemUsageInBytes :size))

(cffi:defcstruct VkShaderStatisticsInfoAMD 
  (shaderStageMask VkShaderStageFlags)
  (resourceUsage VkShaderResourceUsageAMD)
  (numPhysicalVgprs :uint32)
  (numPhysicalSgprs :uint32)
  (numAvailableVgprs :uint32)
  (numAvailableSgprs :uint32)
  (computeWorkGroupSize :uint32 :count 3))

(cffi:defcstruct VkPhysicalDeviceCornerSampledImageFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (cornerSampledImage VkBool32))

(cffi:defcstruct VkExternalImageFormatPropertiesNV 
  (imageFormatProperties VkImageFormatProperties)
  (externalMemoryFeatures VkExternalMemoryFeatureFlagsNV)
  (exportFromImportedHandleTypes VkExternalMemoryHandleTypeFlagsNV)
  (compatibleHandleTypes VkExternalMemoryHandleTypeFlagsNV))

(cffi:defcstruct VkExternalMemoryImageCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalMemoryHandleTypeFlagsNV))

(cffi:defcstruct VkExportMemoryAllocateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleTypes VkExternalMemoryHandleTypeFlagsNV))

(cffi:defcstruct VkValidationFlagsEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (disabledValidationCheckCount :uint32)
  (pDisabledValidationChecks (:pointer VkValidationCheckEXT)))

(cffi:defcstruct VkImageViewASTCDecodeModeEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (decodeMode VkFormat))

(cffi:defcstruct VkPhysicalDeviceASTCDecodeFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (decodeModeSharedExponent VkBool32))

(cffi:defcstruct VkConditionalRenderingBeginInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (flags VkConditionalRenderingFlagsEXT))

(cffi:defcstruct VkPhysicalDeviceConditionalRenderingFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (conditionalRendering VkBool32)
  (inheritedConditionalRendering VkBool32))

(cffi:defcstruct VkCommandBufferInheritanceConditionalRenderingInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (conditionalRenderingEnable VkBool32))

(cffi:defcstruct VkViewportWScalingNV 
  (xcoeff :float)
  (ycoeff :float))

(cffi:defcstruct VkPipelineViewportWScalingStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (viewportWScalingEnable VkBool32)
  (viewportCount :uint32)
  (pViewportWScalings (:pointer VkViewportWScalingNV)))

(cffi:defcstruct VkSurfaceCapabilities2EXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minImageCount :uint32)
  (maxImageCount :uint32)
  (currentExtent VkExtent2D)
  (minImageExtent VkExtent2D)
  (maxImageExtent VkExtent2D)
  (maxImageArrayLayers :uint32)
  (supportedTransforms VkSurfaceTransformFlagsKHR)
  (currentTransform VkSurfaceTransformFlagBitsKHR)
  (supportedCompositeAlpha VkCompositeAlphaFlagsKHR)
  (supportedUsageFlags VkImageUsageFlags)
  (supportedSurfaceCounters VkSurfaceCounterFlagsEXT))

(cffi:defcstruct VkDisplayPowerInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (powerState VkDisplayPowerStateEXT))

(cffi:defcstruct VkDeviceEventInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceEvent VkDeviceEventTypeEXT))

(cffi:defcstruct VkDisplayEventInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (displayEvent VkDisplayEventTypeEXT))

(cffi:defcstruct VkSwapchainCounterCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (surfaceCounters VkSurfaceCounterFlagsEXT))

(cffi:defcstruct VkRefreshCycleDurationGOOGLE 
  (refreshDuration :uint64))

(cffi:defcstruct VkPastPresentationTimingGOOGLE 
  (presentID :uint32)
  (desiredPresentTime :uint64)
  (actualPresentTime :uint64)
  (earliestPresentTime :uint64)
  (presentMargin :uint64))

(cffi:defcstruct VkPresentTimeGOOGLE 
  (presentID :uint32)
  (desiredPresentTime :uint64))

(cffi:defcstruct VkPresentTimesInfoGOOGLE 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (swapchainCount :uint32)
  (pTimes (:pointer VkPresentTimeGOOGLE)))

(cffi:defcstruct VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (perViewPositionAllComponents VkBool32))

(cffi:defcstruct VkViewportSwizzleNV 
  (x VkViewportCoordinateSwizzleNV)
  (y VkViewportCoordinateSwizzleNV)
  (z VkViewportCoordinateSwizzleNV)
  (w VkViewportCoordinateSwizzleNV))

(cffi:defcstruct VkPipelineViewportSwizzleStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineViewportSwizzleStateCreateFlagsNV)
  (viewportCount :uint32)
  (pViewportSwizzles (:pointer VkViewportSwizzleNV)))

(cffi:defcstruct VkPhysicalDeviceDiscardRectanglePropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxDiscardRectangles :uint32))

(cffi:defcstruct VkPipelineDiscardRectangleStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineDiscardRectangleStateCreateFlagsEXT)
  (discardRectangleMode VkDiscardRectangleModeEXT)
  (discardRectangleCount :uint32)
  (pDiscardRectangles (:pointer VkRect2D)))

(cffi:defcstruct VkPhysicalDeviceConservativeRasterizationPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (primitiveOverestimationSize :float)
  (maxExtraPrimitiveOverestimationSize :float)
  (extraPrimitiveOverestimationSizeGranularity :float)
  (primitiveUnderestimation VkBool32)
  (conservativePointAndLineRasterization VkBool32)
  (degenerateTrianglesRasterized VkBool32)
  (degenerateLinesRasterized VkBool32)
  (fullyCoveredFragmentShaderInputVariable VkBool32)
  (conservativeRasterizationPostDepthCoverage VkBool32))

(cffi:defcstruct VkPipelineRasterizationConservativeStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineRasterizationConservativeStateCreateFlagsEXT)
  (conservativeRasterizationMode VkConservativeRasterizationModeEXT)
  (extraPrimitiveOverestimationSize :float))

(cffi:defcstruct VkPhysicalDeviceDepthClipEnableFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (depthClipEnable VkBool32))

(cffi:defcstruct VkPipelineRasterizationDepthClipStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineRasterizationDepthClipStateCreateFlagsEXT)
  (depthClipEnable VkBool32))

(cffi:defcstruct VkXYColorEXT 
  (x :float)
  (y :float))

(cffi:defcstruct VkHdrMetadataEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (displayPrimaryRed VkXYColorEXT)
  (displayPrimaryGreen VkXYColorEXT)
  (displayPrimaryBlue VkXYColorEXT)
  (whitePoint VkXYColorEXT)
  (maxLuminance :float)
  (minLuminance :float)
  (maxContentLightLevel :float)
  (maxFrameAverageLightLevel :float))

(cffi:defcstruct VkDebugUtilsLabelEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pLabelName (:pointer :char))
  (color :float :count 4))

(cffi:defcstruct VkDebugUtilsObjectNameInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (objectType VkObjectType)
  (objectHandle :uint64)
  (pObjectName (:pointer :char)))

(cffi:defcstruct VkDebugUtilsMessengerCallbackDataEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDebugUtilsMessengerCallbackDataFlagsEXT)
  (pMessageIdName (:pointer :char))
  (messageIdNumber :int32)
  (pMessage (:pointer :char))
  (queueLabelCount :uint32)
  (pQueueLabels (:pointer VkDebugUtilsLabelEXT))
  (cmdBufLabelCount :uint32)
  (pCmdBufLabels (:pointer VkDebugUtilsLabelEXT))
  (objectCount :uint32)
  (pObjects (:pointer VkDebugUtilsObjectNameInfoEXT)))

(cffi:defcstruct VkDebugUtilsMessengerCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDebugUtilsMessengerCreateFlagsEXT)
  (messageSeverity VkDebugUtilsMessageSeverityFlagsEXT)
  (messageType VkDebugUtilsMessageTypeFlagsEXT)
  (pfnUserCallback :PFN_vkDebugUtilsMessengerCallbackEXT)
  (pUserData (:pointer :void)))

(cffi:defcstruct VkDebugUtilsObjectTagInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (objectType VkObjectType)
  (objectHandle :uint64)
  (tagName :uint64)
  (tagSize :size)
  (pTag (:pointer :void)))

(cffi:defcstruct VkSampleLocationEXT 
  (x :float)
  (y :float))

(cffi:defcstruct VkSampleLocationsInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (sampleLocationsPerPixel VkSampleCountFlagBits)
  (sampleLocationGridSize VkExtent2D)
  (sampleLocationsCount :uint32)
  (pSampleLocations (:pointer VkSampleLocationEXT)))

(cffi:defcstruct VkAttachmentSampleLocationsEXT 
  (attachmentIndex :uint32)
  (sampleLocationsInfo VkSampleLocationsInfoEXT))

(cffi:defcstruct VkSubpassSampleLocationsEXT 
  (subpassIndex :uint32)
  (sampleLocationsInfo VkSampleLocationsInfoEXT))

(cffi:defcstruct VkRenderPassSampleLocationsBeginInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (attachmentInitialSampleLocationsCount :uint32)
  (pAttachmentInitialSampleLocations (:pointer VkAttachmentSampleLocationsEXT))
  (postSubpassSampleLocationsCount :uint32)
  (pPostSubpassSampleLocations (:pointer VkSubpassSampleLocationsEXT)))

(cffi:defcstruct VkPipelineSampleLocationsStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (sampleLocationsEnable VkBool32)
  (sampleLocationsInfo VkSampleLocationsInfoEXT))

(cffi:defcstruct VkPhysicalDeviceSampleLocationsPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (sampleLocationSampleCounts VkSampleCountFlags)
  (maxSampleLocationGridSize VkExtent2D)
  (sampleLocationCoordinateRange :float :count 2)
  (sampleLocationSubPixelBits :uint32)
  (variableSampleLocations VkBool32))

(cffi:defcstruct VkMultisamplePropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxSampleLocationGridSize VkExtent2D))

(cffi:defcstruct VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (advancedBlendCoherentOperations VkBool32))

(cffi:defcstruct VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (advancedBlendMaxColorAttachments :uint32)
  (advancedBlendIndependentBlend VkBool32)
  (advancedBlendNonPremultipliedSrcColor VkBool32)
  (advancedBlendNonPremultipliedDstColor VkBool32)
  (advancedBlendCorrelatedOverlap VkBool32)
  (advancedBlendAllOperations VkBool32))

(cffi:defcstruct VkPipelineColorBlendAdvancedStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (srcPremultiplied VkBool32)
  (dstPremultiplied VkBool32)
  (blendOverlap VkBlendOverlapEXT))

(cffi:defcstruct VkPipelineCoverageToColorStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCoverageToColorStateCreateFlagsNV)
  (coverageToColorEnable VkBool32)
  (coverageToColorLocation :uint32))

(cffi:defcstruct VkPipelineCoverageModulationStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCoverageModulationStateCreateFlagsNV)
  (coverageModulationMode VkCoverageModulationModeNV)
  (coverageModulationTableEnable VkBool32)
  (coverageModulationTableCount :uint32)
  (pCoverageModulationTable (:pointer :float)))

(cffi:defcstruct VkPhysicalDeviceShaderSMBuiltinsPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderSMCount :uint32)
  (shaderWarpsPerSM :uint32))

(cffi:defcstruct VkPhysicalDeviceShaderSMBuiltinsFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderSMBuiltins VkBool32))

(cffi:defcstruct VkDrmFormatModifierPropertiesEXT 
  (drmFormatModifier :uint64)
  (drmFormatModifierPlaneCount :uint32)
  (drmFormatModifierTilingFeatures VkFormatFeatureFlags))

(cffi:defcstruct VkDrmFormatModifierPropertiesListEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (drmFormatModifierCount :uint32)
  (pDrmFormatModifierProperties (:pointer VkDrmFormatModifierPropertiesEXT)))

(cffi:defcstruct VkPhysicalDeviceImageDrmFormatModifierInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (drmFormatModifier :uint64)
  (sharingMode VkSharingMode)
  (queueFamilyIndexCount :uint32)
  (pQueueFamilyIndices (:pointer :uint32)))

(cffi:defcstruct VkImageDrmFormatModifierListCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (drmFormatModifierCount :uint32)
  (pDrmFormatModifiers (:pointer :uint64)))

(cffi:defcstruct VkImageDrmFormatModifierExplicitCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (drmFormatModifier :uint64)
  (drmFormatModifierPlaneCount :uint32)
  (pPlaneLayouts (:pointer VkSubresourceLayout)))

(cffi:defcstruct VkImageDrmFormatModifierPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (drmFormatModifier :uint64))

(cffi:defcstruct VkDrmFormatModifierProperties2EXT 
  (drmFormatModifier :uint64)
  (drmFormatModifierPlaneCount :uint32)
  (drmFormatModifierTilingFeatures VkFormatFeatureFlags2))

(cffi:defcstruct VkDrmFormatModifierPropertiesList2EXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (drmFormatModifierCount :uint32)
  (pDrmFormatModifierProperties (:pointer VkDrmFormatModifierProperties2EXT)))

(cffi:defcstruct VkValidationCacheCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkValidationCacheCreateFlagsEXT)
  (initialDataSize :size)
  (pInitialData (:pointer :void)))

(cffi:defcstruct VkShaderModuleValidationCacheCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (validationCache VkValidationCacheEXT))

(cffi:defcstruct VkShadingRatePaletteNV 
  (shadingRatePaletteEntryCount :uint32)
  (pShadingRatePaletteEntries (:pointer VkShadingRatePaletteEntryNV)))

(cffi:defcstruct VkPipelineViewportShadingRateImageStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shadingRateImageEnable VkBool32)
  (viewportCount :uint32)
  (pShadingRatePalettes (:pointer VkShadingRatePaletteNV)))

(cffi:defcstruct VkPhysicalDeviceShadingRateImageFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shadingRateImage VkBool32)
  (shadingRateCoarseSampleOrder VkBool32))

(cffi:defcstruct VkPhysicalDeviceShadingRateImagePropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shadingRateTexelSize VkExtent2D)
  (shadingRatePaletteSize :uint32)
  (shadingRateMaxCoarseSamples :uint32))

(cffi:defcstruct VkCoarseSampleLocationNV 
  (pixelX :uint32)
  (pixelY :uint32)
  (sample :uint32))

(cffi:defcstruct VkCoarseSampleOrderCustomNV 
  (shadingRate VkShadingRatePaletteEntryNV)
  (sampleCount :uint32)
  (sampleLocationCount :uint32)
  (pSampleLocations (:pointer VkCoarseSampleLocationNV)))

(cffi:defcstruct VkPipelineViewportCoarseSampleOrderStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (sampleOrderType VkCoarseSampleOrderTypeNV)
  (customSampleOrderCount :uint32)
  (pCustomSampleOrders (:pointer VkCoarseSampleOrderCustomNV)))

(cffi:defcstruct VkRayTracingShaderGroupCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkRayTracingShaderGroupTypeKHR)
  (generalShader :uint32)
  (closestHitShader :uint32)
  (anyHitShader :uint32)
  (intersectionShader :uint32))

(cffi:defcstruct VkRayTracingPipelineCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCreateFlags)
  (stageCount :uint32)
  (pStages (:pointer VkPipelineShaderStageCreateInfo))
  (groupCount :uint32)
  (pGroups (:pointer VkRayTracingShaderGroupCreateInfoNV))
  (maxRecursionDepth :uint32)
  (layout VkPipelineLayout)
  (basePipelineHandle VkPipeline)
  (basePipelineIndex :int32))

(cffi:defcstruct VkGeometryTrianglesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vertexData VkBuffer)
  (vertexOffset VkDeviceSize)
  (vertexCount :uint32)
  (vertexStride VkDeviceSize)
  (vertexFormat VkFormat)
  (indexData VkBuffer)
  (indexOffset VkDeviceSize)
  (indexCount :uint32)
  (indexType VkIndexType)
  (transformData VkBuffer)
  (transformOffset VkDeviceSize))

(cffi:defcstruct VkGeometryAABBNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (aabbData VkBuffer)
  (numAABBs :uint32)
  (stride :uint32)
  (offset VkDeviceSize))

(cffi:defcstruct VkGeometryDataNV 
  (triangles VkGeometryTrianglesNV)
  (aabbs VkGeometryAABBNV))

(cffi:defcstruct VkGeometryNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (geometryType VkGeometryTypeKHR)
  (geometry VkGeometryDataNV)
  (flags VkGeometryFlagsKHR))

(cffi:defcstruct VkAccelerationStructureInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkAccelerationStructureTypeNV)
  (flags VkBuildAccelerationStructureFlagsNV)
  (instanceCount :uint32)
  (geometryCount :uint32)
  (pGeometries (:pointer VkGeometryNV)))

(cffi:defcstruct VkAccelerationStructureCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (compactedSize VkDeviceSize)
  (info VkAccelerationStructureInfoNV))

(cffi:defcstruct VkBindAccelerationStructureMemoryInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (accelerationStructure VkAccelerationStructureNV)
  (memory VkDeviceMemory)
  (memoryOffset VkDeviceSize)
  (deviceIndexCount :uint32)
  (pDeviceIndices (:pointer :uint32)))

(cffi:defcstruct VkWriteDescriptorSetAccelerationStructureNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (accelerationStructureCount :uint32)
  (pAccelerationStructures (:pointer VkAccelerationStructureNV)))

(cffi:defcstruct VkAccelerationStructureMemoryRequirementsInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkAccelerationStructureMemoryRequirementsTypeNV)
  (accelerationStructure VkAccelerationStructureNV))

(cffi:defcstruct VkPhysicalDeviceRayTracingPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderGroupHandleSize :uint32)
  (maxRecursionDepth :uint32)
  (maxShaderGroupStride :uint32)
  (shaderGroupBaseAlignment :uint32)
  (maxGeometryCount :uint64)
  (maxInstanceCount :uint64)
  (maxTriangleCount :uint64)
  (maxDescriptorSetAccelerationStructures :uint32))

(cffi:defcstruct VkTransformMatrixKHR 
  (matrix :float :count 12)) ; Array 3x4

(cffi:defcstruct VkAabbPositionsKHR 
  (minX :float)
  (minY :float)
  (minZ :float)
  (maxX :float)
  (maxY :float)
  (maxZ :float))

(cffi:defcstruct VkAccelerationStructureInstanceKHR  ; TODO: Bitfields
  (transform VkTransformMatrixKHR)
  (instanceCustomIndex :uint32)  ; instanceCustomIndex:24 mask:8  :uint32
  (instanceShaderBindingTableRecordOffset :uint32)  ; (instanceShaderBindingTableRecordOffset:24 :uint32) (flags:8 VkGeometryInstanceFlagsKHR)
  (accelerationStructureReference :uint64))

(cffi:defcstruct VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (representativeFragmentTest VkBool32))

(cffi:defcstruct VkPipelineRepresentativeFragmentTestStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (representativeFragmentTestEnable VkBool32))

(cffi:defcstruct VkPhysicalDeviceImageViewImageFormatInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageViewType VkImageViewType))

(cffi:defcstruct VkFilterCubicImageViewImageFormatPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (filterCubic VkBool32)
  (filterCubicMinmax VkBool32))

(cffi:defcstruct VkImportMemoryHostPointerInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (handleType VkExternalMemoryHandleTypeFlagBits)
  (pHostPointer (:pointer :void)))

(cffi:defcstruct VkMemoryHostPointerPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memoryTypeBits :uint32))

(cffi:defcstruct VkPhysicalDeviceExternalMemoryHostPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minImportedHostPointerAlignment VkDeviceSize))

(cffi:defcstruct VkPipelineCompilerControlCreateInfoAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (compilerControlFlags VkPipelineCompilerControlFlagsAMD))

(cffi:defcstruct VkCalibratedTimestampInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (timeDomain VkTimeDomainEXT))

(cffi:defcstruct VkPhysicalDeviceShaderCorePropertiesAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderEngineCount :uint32)
  (shaderArraysPerEngineCount :uint32)
  (computeUnitsPerShaderArray :uint32)
  (simdPerComputeUnit :uint32)
  (wavefrontsPerSimd :uint32)
  (wavefrontSize :uint32)
  (sgprsPerSimd :uint32)
  (minSgprAllocation :uint32)
  (maxSgprAllocation :uint32)
  (sgprAllocationGranularity :uint32)
  (vgprsPerSimd :uint32)
  (minVgprAllocation :uint32)
  (maxVgprAllocation :uint32)
  (vgprAllocationGranularity :uint32))

(cffi:defcstruct VkDeviceMemoryOverallocationCreateInfoAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (overallocationBehavior VkMemoryOverallocationBehaviorAMD))

(cffi:defcstruct VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxVertexAttribDivisor :uint32))

(cffi:defcstruct VkVertexInputBindingDivisorDescriptionEXT 
  (binding :uint32)
  (divisor :uint32))

(cffi:defcstruct VkPipelineVertexInputDivisorStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vertexBindingDivisorCount :uint32)
  (pVertexBindingDivisors (:pointer VkVertexInputBindingDivisorDescriptionEXT)))

(cffi:defcstruct VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vertexAttributeInstanceRateDivisor VkBool32)
  (vertexAttributeInstanceRateZeroDivisor VkBool32))

(cffi:defcstruct VkPhysicalDeviceComputeShaderDerivativesFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (computeDerivativeGroupQuads VkBool32)
  (computeDerivativeGroupLinear VkBool32))

(cffi:defcstruct VkPhysicalDeviceMeshShaderFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (taskShader VkBool32)
  (meshShader VkBool32))

(cffi:defcstruct VkPhysicalDeviceMeshShaderPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxDrawMeshTasksCount :uint32)
  (maxTaskWorkGroupInvocations :uint32)
  (maxTaskWorkGroupSize :uint32 :count 3)
  (maxTaskTotalMemorySize :uint32)
  (maxTaskOutputCount :uint32)
  (maxMeshWorkGroupInvocations :uint32)
  (maxMeshWorkGroupSize :uint32 :count 3)
  (maxMeshTotalMemorySize :uint32)
  (maxMeshOutputVertices :uint32)
  (maxMeshOutputPrimitives :uint32)
  (maxMeshMultiviewViewCount :uint32)
  (meshOutputPerVertexGranularity :uint32)
  (meshOutputPerPrimitiveGranularity :uint32))

(cffi:defcstruct VkDrawMeshTasksIndirectCommandNV 
  (taskCount :uint32)
  (firstTask :uint32))

(cffi:defcstruct VkPhysicalDeviceShaderImageFootprintFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageFootprint VkBool32))

(cffi:defcstruct VkPipelineViewportExclusiveScissorStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (exclusiveScissorCount :uint32)
  (pExclusiveScissors (:pointer VkRect2D)))

(cffi:defcstruct VkPhysicalDeviceExclusiveScissorFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (exclusiveScissor VkBool32))

(cffi:defcstruct VkQueueFamilyCheckpointPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (checkpointExecutionStageMask VkPipelineStageFlags))

(cffi:defcstruct VkCheckpointDataNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stage VkPipelineStageFlagBits)
  (pCheckpointMarker (:pointer :void)))

(cffi:defcstruct VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderIntegerFunctions2 VkBool32))

(cffi:defcstruct VkPerformanceValueINTEL 
  (type VkPerformanceValueTypeINTEL)
  (data VkPerformanceValueDataINTEL))

(cffi:defcstruct VkInitializePerformanceApiInfoINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pUserData (:pointer :void)))

(cffi:defcstruct VkQueryPoolPerformanceQueryCreateInfoINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (performanceCountersSampling VkQueryPoolSamplingModeINTEL))

(cffi:defcstruct VkPerformanceMarkerInfoINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (marker :uint64))

(cffi:defcstruct VkPerformanceStreamMarkerInfoINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (marker :uint32))

(cffi:defcstruct VkPerformanceOverrideInfoINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkPerformanceOverrideTypeINTEL)
  (enable VkBool32)
  (parameter :uint64))

(cffi:defcstruct VkPerformanceConfigurationAcquireInfoINTEL 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkPerformanceConfigurationTypeINTEL))

(cffi:defcstruct VkPhysicalDevicePCIBusInfoPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pciDomain :uint32)
  (pciBus :uint32)
  (pciDevice :uint32)
  (pciFunction :uint32))

(cffi:defcstruct VkDisplayNativeHdrSurfaceCapabilitiesAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (localDimmingSupport VkBool32))

(cffi:defcstruct VkSwapchainDisplayNativeHdrCreateInfoAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (localDimmingEnable VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentDensityMapFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentDensityMap VkBool32)
  (fragmentDensityMapDynamic VkBool32)
  (fragmentDensityMapNonSubsampledImages VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentDensityMapPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minFragmentDensityTexelSize VkExtent2D)
  (maxFragmentDensityTexelSize VkExtent2D)
  (fragmentDensityInvocations VkBool32))

(cffi:defcstruct VkRenderPassFragmentDensityMapCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentDensityMapAttachment VkAttachmentReference))

(cffi:defcstruct VkPhysicalDeviceShaderCoreProperties2AMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderCoreFeatures VkShaderCorePropertiesFlagsAMD)
  (activeComputeUnitCount :uint32))

(cffi:defcstruct VkPhysicalDeviceCoherentMemoryFeaturesAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceCoherentMemory VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderImageInt64Atomics VkBool32)
  (sparseImageInt64Atomics VkBool32))

(cffi:defcstruct VkPhysicalDeviceMemoryBudgetPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (heapBudget VkDeviceSize :count VK_MAX_MEMORY_HEAPS)
  (heapUsage VkDeviceSize :count VK_MAX_MEMORY_HEAPS))

(cffi:defcstruct VkPhysicalDeviceMemoryPriorityFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memoryPriority VkBool32))

(cffi:defcstruct VkMemoryPriorityAllocateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (priority :float))

(cffi:defcstruct VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (dedicatedAllocationImageAliasing VkBool32))

(cffi:defcstruct VkPhysicalDeviceBufferDeviceAddressFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (bufferDeviceAddress VkBool32)
  (bufferDeviceAddressCaptureReplay VkBool32)
  (bufferDeviceAddressMultiDevice VkBool32))

(cffi:defcstruct VkBufferDeviceAddressCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceAddress VkDeviceAddress))

(cffi:defcstruct VkValidationFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (enabledValidationFeatureCount :uint32)
  (pEnabledValidationFeatures (:pointer VkValidationFeatureEnableEXT))
  (disabledValidationFeatureCount :uint32)
  (pDisabledValidationFeatures (:pointer VkValidationFeatureDisableEXT)))

(cffi:defcstruct VkCooperativeMatrixPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (MSize :uint32)
  (NSize :uint32)
  (KSize :uint32)
  (AType VkComponentTypeNV)
  (BType VkComponentTypeNV)
  (CType VkComponentTypeNV)
  (DType VkComponentTypeNV)
  (scope VkScopeNV))

(cffi:defcstruct VkPhysicalDeviceCooperativeMatrixFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (cooperativeMatrix VkBool32)
  (cooperativeMatrixRobustBufferAccess VkBool32))

(cffi:defcstruct VkPhysicalDeviceCooperativeMatrixPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (cooperativeMatrixSupportedStages VkShaderStageFlags))

(cffi:defcstruct VkPhysicalDeviceCoverageReductionModeFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (coverageReductionMode VkBool32))

(cffi:defcstruct VkPipelineCoverageReductionStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCoverageReductionStateCreateFlagsNV)
  (coverageReductionMode VkCoverageReductionModeNV))

(cffi:defcstruct VkFramebufferMixedSamplesCombinationNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (coverageReductionMode VkCoverageReductionModeNV)
  (rasterizationSamples VkSampleCountFlagBits)
  (depthStencilSamples VkSampleCountFlags)
  (colorSamples VkSampleCountFlags))

(cffi:defcstruct VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentShaderSampleInterlock VkBool32)
  (fragmentShaderPixelInterlock VkBool32)
  (fragmentShaderShadingRateInterlock VkBool32))

(cffi:defcstruct VkPhysicalDeviceYcbcrImageArraysFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (ycbcrImageArrays VkBool32))

(cffi:defcstruct VkPhysicalDeviceProvokingVertexFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (provokingVertexLast VkBool32)
  (transformFeedbackPreservesProvokingVertex VkBool32))

(cffi:defcstruct VkPhysicalDeviceProvokingVertexPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (provokingVertexModePerPipeline VkBool32)
  (transformFeedbackPreservesTriangleFanProvokingVertex VkBool32))

(cffi:defcstruct VkPipelineRasterizationProvokingVertexStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (provokingVertexMode VkProvokingVertexModeEXT))

(cffi:defcstruct VkHeadlessSurfaceCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkHeadlessSurfaceCreateFlagsEXT))

(cffi:defcstruct VkPhysicalDeviceLineRasterizationFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rectangularLines VkBool32)
  (bresenhamLines VkBool32)
  (smoothLines VkBool32)
  (stippledRectangularLines VkBool32)
  (stippledBresenhamLines VkBool32)
  (stippledSmoothLines VkBool32))

(cffi:defcstruct VkPhysicalDeviceLineRasterizationPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (lineSubPixelPrecisionBits :uint32))

(cffi:defcstruct VkPipelineRasterizationLineStateCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (lineRasterizationMode VkLineRasterizationModeEXT)
  (stippledLineEnable VkBool32)
  (lineStippleFactor :uint32)
  (lineStipplePattern :uint16))

(cffi:defcstruct VkPhysicalDeviceShaderAtomicFloatFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderBufferFloat32Atomics VkBool32)
  (shaderBufferFloat32AtomicAdd VkBool32)
  (shaderBufferFloat64Atomics VkBool32)
  (shaderBufferFloat64AtomicAdd VkBool32)
  (shaderSharedFloat32Atomics VkBool32)
  (shaderSharedFloat32AtomicAdd VkBool32)
  (shaderSharedFloat64Atomics VkBool32)
  (shaderSharedFloat64AtomicAdd VkBool32)
  (shaderImageFloat32Atomics VkBool32)
  (shaderImageFloat32AtomicAdd VkBool32)
  (sparseImageFloat32Atomics VkBool32)
  (sparseImageFloat32AtomicAdd VkBool32))

(cffi:defcstruct VkPhysicalDeviceIndexTypeUint8FeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (indexTypeUint8 VkBool32))

(cffi:defcstruct VkPhysicalDeviceExtendedDynamicStateFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (extendedDynamicState VkBool32))

(cffi:defcstruct VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderBufferFloat16Atomics VkBool32)
  (shaderBufferFloat16AtomicAdd VkBool32)
  (shaderBufferFloat16AtomicMinMax VkBool32)
  (shaderBufferFloat32AtomicMinMax VkBool32)
  (shaderBufferFloat64AtomicMinMax VkBool32)
  (shaderSharedFloat16Atomics VkBool32)
  (shaderSharedFloat16AtomicAdd VkBool32)
  (shaderSharedFloat16AtomicMinMax VkBool32)
  (shaderSharedFloat32AtomicMinMax VkBool32)
  (shaderSharedFloat64AtomicMinMax VkBool32)
  (shaderImageFloat32AtomicMinMax VkBool32)
  (sparseImageFloat32AtomicMinMax VkBool32))

(cffi:defcstruct VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxGraphicsShaderGroupCount :uint32)
  (maxIndirectSequenceCount :uint32)
  (maxIndirectCommandsTokenCount :uint32)
  (maxIndirectCommandsStreamCount :uint32)
  (maxIndirectCommandsTokenOffset :uint32)
  (maxIndirectCommandsStreamStride :uint32)
  (minSequencesCountBufferOffsetAlignment :uint32)
  (minSequencesIndexBufferOffsetAlignment :uint32)
  (minIndirectCommandsBufferOffsetAlignment :uint32))

(cffi:defcstruct VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceGeneratedCommands VkBool32))

(cffi:defcstruct VkGraphicsShaderGroupCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (stageCount :uint32)
  (pStages (:pointer VkPipelineShaderStageCreateInfo))
  (pVertexInputState (:pointer VkPipelineVertexInputStateCreateInfo))
  (pTessellationState (:pointer VkPipelineTessellationStateCreateInfo)))

(cffi:defcstruct VkGraphicsPipelineShaderGroupsCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (groupCount :uint32)
  (pGroups (:pointer VkGraphicsShaderGroupCreateInfoNV))
  (pipelineCount :uint32)
  (pPipelines (:pointer VkPipeline)))

(cffi:defcstruct VkBindShaderGroupIndirectCommandNV 
  (groupIndex :uint32))

(cffi:defcstruct VkBindIndexBufferIndirectCommandNV 
  (bufferAddress VkDeviceAddress)
  (size :uint32)
  (indexType VkIndexType))

(cffi:defcstruct VkBindVertexBufferIndirectCommandNV 
  (bufferAddress VkDeviceAddress)
  (size :uint32)
  (stride :uint32))

(cffi:defcstruct VkSetStateFlagsIndirectCommandNV 
  (data :uint32))

(cffi:defcstruct VkIndirectCommandsStreamNV 
  (buffer VkBuffer)
  (offset VkDeviceSize))

(cffi:defcstruct VkIndirectCommandsLayoutTokenNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (tokenType VkIndirectCommandsTokenTypeNV)
  (stream :uint32)
  (offset :uint32)
  (vertexBindingUnit :uint32)
  (vertexDynamicStride VkBool32)
  (pushconstantPipelineLayout VkPipelineLayout)
  (pushconstantShaderStageFlags VkShaderStageFlags)
  (pushconstantOffset :uint32)
  (pushconstantSize :uint32)
  (indirectStateFlags VkIndirectStateFlagsNV)
  (indexTypeCount :uint32)
  (pIndexTypes (:pointer VkIndexType))
  (pIndexTypeValues (:pointer :uint32)))

(cffi:defcstruct VkIndirectCommandsLayoutCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkIndirectCommandsLayoutUsageFlagsNV)
  (pipelineBindPoint VkPipelineBindPoint)
  (tokenCount :uint32)
  (pTokens (:pointer VkIndirectCommandsLayoutTokenNV))
  (streamCount :uint32)
  (pStreamStrides (:pointer :uint32)))

(cffi:defcstruct VkGeneratedCommandsInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelineBindPoint VkPipelineBindPoint)
  (pipeline VkPipeline)
  (indirectCommandsLayout VkIndirectCommandsLayoutNV)
  (streamCount :uint32)
  (pStreams (:pointer VkIndirectCommandsStreamNV))
  (sequencesCount :uint32)
  (preprocessBuffer VkBuffer)
  (preprocessOffset VkDeviceSize)
  (preprocessSize VkDeviceSize)
  (sequencesCountBuffer VkBuffer)
  (sequencesCountOffset VkDeviceSize)
  (sequencesIndexBuffer VkBuffer)
  (sequencesIndexOffset VkDeviceSize))

(cffi:defcstruct VkGeneratedCommandsMemoryRequirementsInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelineBindPoint VkPipelineBindPoint)
  (pipeline VkPipeline)
  (indirectCommandsLayout VkIndirectCommandsLayoutNV)
  (maxSequencesCount :uint32))

(cffi:defcstruct VkPhysicalDeviceInheritedViewportScissorFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (inheritedViewportScissor2D VkBool32))

(cffi:defcstruct VkCommandBufferInheritanceViewportScissorInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (viewportScissor2D VkBool32)
  (viewportDepthCount :uint32)
  (pViewportDepths (:pointer VkViewport)))

(cffi:defcstruct VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (texelBufferAlignment VkBool32))

(cffi:defcstruct VkRenderPassTransformBeginInfoQCOM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (transform VkSurfaceTransformFlagBitsKHR))

(cffi:defcstruct VkCommandBufferInheritanceRenderPassTransformInfoQCOM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (transform VkSurfaceTransformFlagBitsKHR)
  (renderArea VkRect2D))

(cffi:defcstruct VkPhysicalDeviceDeviceMemoryReportFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (deviceMemoryReport VkBool32))

(cffi:defcstruct VkDeviceMemoryReportCallbackDataEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDeviceMemoryReportFlagsEXT)
  (type VkDeviceMemoryReportEventTypeEXT)
  (memoryObjectId :uint64)
  (size VkDeviceSize)
  (objectType VkObjectType)
  (objectHandle :uint64)
  (heapIndex :uint32))

(cffi:defcstruct VkDeviceDeviceMemoryReportCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDeviceMemoryReportFlagsEXT)
  (pfnUserCallback :PFN_vkDeviceMemoryReportCallbackEXT)
  (pUserData (:pointer :void)))

(cffi:defcstruct VkPhysicalDeviceRobustness2FeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (robustBufferAccess2 VkBool32)
  (robustImageAccess2 VkBool32)
  (nullDescriptor VkBool32))

(cffi:defcstruct VkPhysicalDeviceRobustness2PropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (robustStorageBufferAccessSizeAlignment VkDeviceSize)
  (robustUniformBufferAccessSizeAlignment VkDeviceSize))

(cffi:defcstruct VkSamplerCustomBorderColorCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (customBorderColor VkClearColorValue)
  (format VkFormat))

(cffi:defcstruct VkPhysicalDeviceCustomBorderColorPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxCustomBorderColorSamplers :uint32))

(cffi:defcstruct VkPhysicalDeviceCustomBorderColorFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (customBorderColors VkBool32)
  (customBorderColorWithoutFormat VkBool32))

(cffi:defcstruct VkPhysicalDeviceDiagnosticsConfigFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (diagnosticsConfig VkBool32))

(cffi:defcstruct VkDeviceDiagnosticsConfigCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkDeviceDiagnosticsConfigFlagsNV))

(cffi:defcstruct VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (graphicsPipelineLibrary VkBool32))

(cffi:defcstruct VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (graphicsPipelineLibraryFastLinking VkBool32)
  (graphicsPipelineLibraryIndependentInterpolationDecoration VkBool32))

(cffi:defcstruct VkGraphicsPipelineLibraryCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkGraphicsPipelineLibraryFlagsEXT))

(cffi:defcstruct VkPhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderEarlyAndLateFragmentTests VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentShadingRateEnums VkBool32)
  (supersampleFragmentShadingRates VkBool32)
  (noInvocationFragmentShadingRates VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxFragmentShadingRateInvocationCount VkSampleCountFlagBits))

(cffi:defcstruct VkPipelineFragmentShadingRateEnumStateCreateInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shadingRateType VkFragmentShadingRateTypeNV)
  (shadingRate VkFragmentShadingRateNV)
  (combinerOps VkFragmentShadingRateCombinerOpKHR :count 2))

(cffi:defcstruct VkAccelerationStructureGeometryMotionTrianglesDataNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vertexData VkDeviceOrHostAddressConstKHR))

(cffi:defcstruct VkAccelerationStructureMotionInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxInstances :uint32)
  (flags VkAccelerationStructureMotionInfoFlagsNV))

(cffi:defcstruct VkAccelerationStructureMatrixMotionInstanceNV  ; TODO: Bitfields
  (transformT0 VkTransformMatrixKHR)
  (transformT1 VkTransformMatrixKHR)
  (instanceCustomIndex :uint32) ; instanceCustomIndex:24 mask:8  :uint32  
  (instanceShaderBindingTableRecordOffset :uint32) ; (instanceShaderBindingTableRecordOffset:24 :uint32) (flags:8 VkGeometryInstanceFlagsKHR)  
  (accelerationStructureReference :uint64))

(cffi:defcstruct VkSRTDataNV 
  (sx :float)
  (a :float)
  (b :float)
  (pvx :float)
  (sy :float)
  (c :float)
  (pvy :float)
  (sz :float)
  (pvz :float)
  (qx :float)
  (qy :float)
  (qz :float)
  (qw :float)
  (tx :float)
  (ty :float)
  (tz :float))

(cffi:defcstruct VkAccelerationStructureSRTMotionInstanceNV  ; TODO: Bitfields
  (transformT0 VkSRTDataNV)
  (transformT1 VkSRTDataNV)
  (instanceCustomIndex :uint32)  ; instanceCustomIndex:24 mask:8  :uint32
  (instanceShaderBindingTableRecordOffset :uint32)  ; (instanceShaderBindingTableRecordOffset:24 :uint32) (flags:8 VkGeometryInstanceFlagsKHR)
  (accelerationStructureReference :uint64))

(cffi:defcstruct VkAccelerationStructureMotionInstanceNV 
  (type VkAccelerationStructureMotionInstanceTypeNV)
  (flags VkAccelerationStructureMotionInstanceFlagsNV)
  (data VkAccelerationStructureMotionInstanceDataNV))

(cffi:defcstruct VkPhysicalDeviceRayTracingMotionBlurFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rayTracingMotionBlur VkBool32)
  (rayTracingMotionBlurPipelineTraceRaysIndirect VkBool32))

(cffi:defcstruct VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (ycbcr2plane444Formats VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentDensityMap2FeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentDensityMapDeferred VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentDensityMap2PropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subsampledLoads VkBool32)
  (subsampledCoarseReconstructionEarlyAccess VkBool32)
  (maxSubsampledArrayLayers :uint32)
  (maxDescriptorSetSubsampledSamplers :uint32))

(cffi:defcstruct VkCopyCommandTransformInfoQCOM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (transform VkSurfaceTransformFlagBitsKHR))

(cffi:defcstruct VkPhysicalDeviceImageCompressionControlFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageCompressionControl VkBool32))

(cffi:defcstruct VkImageCompressionControlEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkImageCompressionFlagsEXT)
  (compressionControlPlaneCount :uint32)
  (pFixedRateFlags (:pointer VkImageCompressionFixedRateFlagsEXT)))

(cffi:defcstruct VkSubresourceLayout2EXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subresourceLayout VkSubresourceLayout))

(cffi:defcstruct VkImageSubresource2EXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageSubresource VkImageSubresource))

(cffi:defcstruct VkImageCompressionPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageCompressionFlags VkImageCompressionFlagsEXT)
  (imageCompressionFixedRateFlags VkImageCompressionFixedRateFlagsEXT))

(cffi:defcstruct VkPhysicalDevice4444FormatsFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (formatA4R4G4B4 VkBool32)
  (formatA4B4G4R4 VkBool32))

(cffi:defcstruct VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rasterizationOrderColorAttachmentAccess VkBool32)
  (rasterizationOrderDepthAttachmentAccess VkBool32)
  (rasterizationOrderStencilAttachmentAccess VkBool32))

(cffi:defcstruct VkPhysicalDeviceRGBA10X6FormatsFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (formatRgba10x6WithoutYCbCrSampler VkBool32))

(cffi:defcstruct VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (mutableDescriptorType VkBool32))

(cffi:defcstruct VkMutableDescriptorTypeListVALVE 
  (descriptorTypeCount :uint32)
  (pDescriptorTypes (:pointer VkDescriptorType)))

(cffi:defcstruct VkMutableDescriptorTypeCreateInfoVALVE 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (mutableDescriptorTypeListCount :uint32)
  (pMutableDescriptorTypeLists (:pointer VkMutableDescriptorTypeListVALVE)))

(cffi:defcstruct VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vertexInputDynamicState VkBool32))

(cffi:defcstruct VkVertexInputBindingDescription2EXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (binding :uint32)
  (stride :uint32)
  (inputRate VkVertexInputRate)
  (divisor :uint32))

(cffi:defcstruct VkVertexInputAttributeDescription2EXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (location :uint32)
  (binding :uint32)
  (format VkFormat)
  (offset :uint32))

(cffi:defcstruct VkPhysicalDeviceDrmPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (hasPrimary VkBool32)
  (hasRender VkBool32)
  (primaryMajor :int64)
  (primaryMinor :int64)
  (renderMajor :int64)
  (renderMinor :int64))

(cffi:defcstruct VkPhysicalDeviceDepthClipControlFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (depthClipControl VkBool32))

(cffi:defcstruct VkPipelineViewportDepthClipControlCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (negativeOneToOne VkBool32))

(cffi:defcstruct VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (primitiveTopologyListRestart VkBool32)
  (primitiveTopologyPatchListRestart VkBool32))

(cffi:defcstruct VkSubpassShadingPipelineCreateInfoHUAWEI 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (renderPass VkRenderPass)
  (subpass :uint32))

(cffi:defcstruct VkPhysicalDeviceSubpassShadingFeaturesHUAWEI 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subpassShading VkBool32))

(cffi:defcstruct VkPhysicalDeviceSubpassShadingPropertiesHUAWEI 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxSubpassShadingWorkgroupSizeAspectRatio :uint32))

(cffi:defcstruct VkPhysicalDeviceInvocationMaskFeaturesHUAWEI 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (invocationMask VkBool32))

(cffi:defcstruct VkMemoryGetRemoteAddressInfoNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (memory VkDeviceMemory)
  (handleType VkExternalMemoryHandleTypeFlagBits))

(cffi:defcstruct VkPhysicalDeviceExternalMemoryRDMAFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (externalMemoryRDMA VkBool32))

(cffi:defcstruct VkPipelinePropertiesIdentifierEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelineIdentifier :uint8 :count VK_UUID_SIZE))

(cffi:defcstruct VkPhysicalDevicePipelinePropertiesFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pipelinePropertiesIdentifier VkBool32))

(cffi:defcstruct VkPhysicalDeviceExtendedDynamicState2FeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (extendedDynamicState2 VkBool32)
  (extendedDynamicState2LogicOp VkBool32)
  (extendedDynamicState2PatchControlPoints VkBool32))

(cffi:defcstruct VkPhysicalDeviceColorWriteEnableFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (colorWriteEnable VkBool32))

(cffi:defcstruct VkPipelineColorWriteCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (attachmentCount :uint32)
  (pColorWriteEnables (:pointer VkBool32)))

(cffi:defcstruct VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (primitivesGeneratedQuery VkBool32)
  (primitivesGeneratedQueryWithRasterizerDiscard VkBool32)
  (primitivesGeneratedQueryWithNonZeroStreams VkBool32))

(cffi:defcstruct VkPhysicalDeviceImageViewMinLodFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minLod VkBool32))

(cffi:defcstruct VkImageViewMinLodCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (minLod :float))

(cffi:defcstruct VkPhysicalDeviceMultiDrawFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (multiDraw VkBool32))

(cffi:defcstruct VkPhysicalDeviceMultiDrawPropertiesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxMultiDrawCount :uint32))

(cffi:defcstruct VkMultiDrawInfoEXT 
  (firstVertex :uint32)
  (vertexCount :uint32))

(cffi:defcstruct VkMultiDrawIndexedInfoEXT 
  (firstIndex :uint32)
  (indexCount :uint32)
  (vertexOffset :int32))

(cffi:defcstruct VkPhysicalDeviceImage2DViewOf3DFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (image2DViewOf3D VkBool32)
  (sampler2DViewOf3D VkBool32))

(cffi:defcstruct VkPhysicalDeviceBorderColorSwizzleFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (borderColorSwizzle VkBool32)
  (borderColorSwizzleFromImage VkBool32))

(cffi:defcstruct VkSamplerBorderColorComponentMappingCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (components VkComponentMapping)
  (srgb VkBool32))

(cffi:defcstruct VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pageableDeviceLocalMemory VkBool32))

(cffi:defcstruct VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (descriptorSetHostMapping VkBool32))

(cffi:defcstruct VkDescriptorSetBindingReferenceVALVE 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (descriptorSetLayout VkDescriptorSetLayout)
  (binding :uint32))

(cffi:defcstruct VkDescriptorSetLayoutHostMappingInfoVALVE 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (descriptorOffset :size)
  (descriptorSize :uint32))

(cffi:defcstruct VkPhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentDensityMapOffset VkBool32))

(cffi:defcstruct VkPhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentDensityOffsetGranularity VkExtent2D))

(cffi:defcstruct VkSubpassFragmentDensityMapOffsetEndInfoQCOM 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (fragmentDensityOffsetCount :uint32)
  (pFragmentDensityOffsets (:pointer VkOffset2D)))

(cffi:defcstruct VkPhysicalDeviceLinearColorAttachmentFeaturesNV 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (linearColorAttachment VkBool32))

(cffi:defcstruct VkPhysicalDeviceImageCompressionControlSwapchainFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (imageCompressionControlSwapchain VkBool32))

(cffi:defcstruct VkPhysicalDeviceSubpassMergeFeedbackFeaturesEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (subpassMergeFeedback VkBool32))

(cffi:defcstruct VkRenderPassCreationControlEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (disallowMerging VkBool32))

(cffi:defcstruct VkRenderPassCreationFeedbackInfoEXT 
  (postMergeSubpassCount :uint32))

(cffi:defcstruct VkRenderPassCreationFeedbackCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pRenderPassFeedback (:pointer VkRenderPassCreationFeedbackInfoEXT)))

(cffi:defcstruct VkRenderPassSubpassFeedbackInfoEXT 
  (subpassMergeStatus VkSubpassMergeStatusEXT)
  (description :char :count VK_MAX_DESCRIPTION_SIZE)
  (postMergeIndex :uint32))

(cffi:defcstruct VkRenderPassSubpassFeedbackCreateInfoEXT 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pSubpassFeedback (:pointer VkRenderPassSubpassFeedbackInfoEXT)))

(cffi:defcstruct VkAccelerationStructureBuildRangeInfoKHR 
  (primitiveCount :uint32)
  (primitiveOffset :uint32)
  (firstVertex :uint32)
  (transformOffset :uint32))

(cffi:defcstruct VkAccelerationStructureGeometryTrianglesDataKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (vertexFormat VkFormat)
  (vertexData VkDeviceOrHostAddressConstKHR)
  (vertexStride VkDeviceSize)
  (maxVertex :uint32)
  (indexType VkIndexType)
  (indexData VkDeviceOrHostAddressConstKHR)
  (transformData VkDeviceOrHostAddressConstKHR))

(cffi:defcstruct VkAccelerationStructureGeometryAabbsDataKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (data VkDeviceOrHostAddressConstKHR)
  (stride VkDeviceSize))

(cffi:defcstruct VkAccelerationStructureGeometryInstancesDataKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (arrayOfPointers VkBool32)
  (data VkDeviceOrHostAddressConstKHR))

(cffi:defcstruct VkAccelerationStructureGeometryKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (geometryType VkGeometryTypeKHR)
  (geometry VkAccelerationStructureGeometryDataKHR)
  (flags VkGeometryFlagsKHR))

(cffi:defcstruct VkAccelerationStructureBuildGeometryInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkAccelerationStructureTypeKHR)
  (flags VkBuildAccelerationStructureFlagsKHR)
  (mode VkBuildAccelerationStructureModeKHR)
  (srcAccelerationStructure VkAccelerationStructureKHR)
  (dstAccelerationStructure VkAccelerationStructureKHR)
  (geometryCount :uint32)
  (pGeometries (:pointer VkAccelerationStructureGeometryKHR))
  (ppGeometries (:pointer VkAccelerationStructureGeometryKHR))
  (scratchData VkDeviceOrHostAddressKHR))

(cffi:defcstruct VkAccelerationStructureCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (createFlags VkAccelerationStructureCreateFlagsKHR)
  (buffer VkBuffer)
  (offset VkDeviceSize)
  (size VkDeviceSize)
  (type VkAccelerationStructureTypeKHR)
  (deviceAddress VkDeviceAddress))

(cffi:defcstruct VkWriteDescriptorSetAccelerationStructureKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (accelerationStructureCount :uint32)
  (pAccelerationStructures (:pointer VkAccelerationStructureKHR)))

(cffi:defcstruct VkPhysicalDeviceAccelerationStructureFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (accelerationStructure VkBool32)
  (accelerationStructureCaptureReplay VkBool32)
  (accelerationStructureIndirectBuild VkBool32)
  (accelerationStructureHostCommands VkBool32)
  (descriptorBindingAccelerationStructureUpdateAfterBind VkBool32))

(cffi:defcstruct VkPhysicalDeviceAccelerationStructurePropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxGeometryCount :uint64)
  (maxInstanceCount :uint64)
  (maxPrimitiveCount :uint64)
  (maxPerStageDescriptorAccelerationStructures :uint32)
  (maxPerStageDescriptorUpdateAfterBindAccelerationStructures :uint32)
  (maxDescriptorSetAccelerationStructures :uint32)
  (maxDescriptorSetUpdateAfterBindAccelerationStructures :uint32)
  (minAccelerationStructureScratchOffsetAlignment :uint32))

(cffi:defcstruct VkAccelerationStructureDeviceAddressInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (accelerationStructure VkAccelerationStructureKHR))

(cffi:defcstruct VkAccelerationStructureVersionInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (pVersionData (:pointer :uint8)))

(cffi:defcstruct VkCopyAccelerationStructureToMemoryInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (src VkAccelerationStructureKHR)
  (dst VkDeviceOrHostAddressKHR)
  (mode VkCopyAccelerationStructureModeKHR))

(cffi:defcstruct VkCopyMemoryToAccelerationStructureInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (src VkDeviceOrHostAddressConstKHR)
  (dst VkAccelerationStructureKHR)
  (mode VkCopyAccelerationStructureModeKHR))

(cffi:defcstruct VkCopyAccelerationStructureInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (src VkAccelerationStructureKHR)
  (dst VkAccelerationStructureKHR)
  (mode VkCopyAccelerationStructureModeKHR))

(cffi:defcstruct VkAccelerationStructureBuildSizesInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (accelerationStructureSize VkDeviceSize)
  (updateScratchSize VkDeviceSize)
  (buildScratchSize VkDeviceSize))

(cffi:defcstruct VkRayTracingShaderGroupCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (type VkRayTracingShaderGroupTypeKHR)
  (generalShader :uint32)
  (closestHitShader :uint32)
  (anyHitShader :uint32)
  (intersectionShader :uint32)
  (pShaderGroupCaptureReplayHandle (:pointer :void)))

(cffi:defcstruct VkRayTracingPipelineInterfaceCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (maxPipelineRayPayloadSize :uint32)
  (maxPipelineRayHitAttributeSize :uint32))

(cffi:defcstruct VkRayTracingPipelineCreateInfoKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (flags VkPipelineCreateFlags)
  (stageCount :uint32)
  (pStages (:pointer VkPipelineShaderStageCreateInfo))
  (groupCount :uint32)
  (pGroups (:pointer VkRayTracingShaderGroupCreateInfoKHR))
  (maxPipelineRayRecursionDepth :uint32)
  (pLibraryInfo (:pointer VkPipelineLibraryCreateInfoKHR))
  (pLibraryInterface (:pointer VkRayTracingPipelineInterfaceCreateInfoKHR))
  (pDynamicState (:pointer VkPipelineDynamicStateCreateInfo))
  (layout VkPipelineLayout)
  (basePipelineHandle VkPipeline)
  (basePipelineIndex :int32))

(cffi:defcstruct VkPhysicalDeviceRayTracingPipelineFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rayTracingPipeline VkBool32)
  (rayTracingPipelineShaderGroupHandleCaptureReplay VkBool32)
  (rayTracingPipelineShaderGroupHandleCaptureReplayMixed VkBool32)
  (rayTracingPipelineTraceRaysIndirect VkBool32)
  (rayTraversalPrimitiveCulling VkBool32))

(cffi:defcstruct VkPhysicalDeviceRayTracingPipelinePropertiesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (shaderGroupHandleSize :uint32)
  (maxRayRecursionDepth :uint32)
  (maxShaderGroupStride :uint32)
  (shaderGroupBaseAlignment :uint32)
  (shaderGroupHandleCaptureReplaySize :uint32)
  (maxRayDispatchInvocationCount :uint32)
  (shaderGroupHandleAlignment :uint32)
  (maxRayHitAttributeSize :uint32))

(cffi:defcstruct VkStridedDeviceAddressRegionKHR 
  (deviceAddress VkDeviceAddress)
  (stride VkDeviceSize)
  (size VkDeviceSize))

(cffi:defcstruct VkTraceRaysIndirectCommandKHR 
  (width :uint32)
  (height :uint32)
  (depth :uint32))

(cffi:defcstruct VkPhysicalDeviceRayQueryFeaturesKHR 
  (sType VkStructureType)
  (pNext (:pointer :void))
  (rayQuery VkBool32))
