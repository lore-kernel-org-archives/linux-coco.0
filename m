Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718539DBC9
	for <linux-coco@lists.linux.dev>; Mon, 30 Mar 2026 20:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904320; cv=none; b=NwWnyhz803OogfednGmZFz8prB8R3nbhbI0/FvWFMXt9jhqlxyBzEg8UMwcTWldGVZ5CTyRcXlUHe/JK9n6m5CIeSUUmysFanpMVj8B5jmKj/kci2p+N0gyu1hqOD/5Qy4chLd0yIGkrTUkKY/2jeQtS1HHsnoM3IMut3oo8qhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904320; c=relaxed/simple;
	bh=CRmFwhZ9DgLfZWDSog6+tG2wzgNWOv5/Op/t2/OxVlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbe6T/xRmkub1tWRC43XriX2+3VvAEjk9Pz75dOJrM0c6ocGpvT1ioqnv1d2SYkBgjFmm7xP749ZR4LOARlB6AKKAmIBTLnzdrH3fSYrMr1lEpmrBZiOkzaRc2EBCXKAeGCEAcTfHRTkCz932zjVZhPPYl9PHIOtmzkWTAADLNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGu9akNB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGu9akNB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1800421a12.3
        for <linux-coco@lists.linux.dev>; Mon, 30 Mar 2026 13:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774904317; x=1775509117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frztTOmTf3SkuLYaPWUosPvcRTJGFbSFXLD1W9fYAwY=;
        b=SGu9akNBAM+VsU4blXHQ1AtsY0qB9M9ZKHufZTaoNE8Ml0U6mDFvYkzH5CyMjZSHLX
         gdXSzaLg7n53jAa6o1/BpRSJcSc4FRBrhvtmHFbw8dyERPMRPzuu/KRhhiFElT9M1WOK
         v0jCGxsztRvlLjHVDYoQOy5z86eA1SnoQejQG8UdCvdlRt+3lQu4KRENjvUcINWDpw+H
         uu/lm4H7VGEKd2U7WZdRh/LrXLSVxLoiG10nCmFUm6p8+kWzBwZ/VoTUXiaTUWEQ89va
         lH++N7A6RfDIAtkIe7yMrncPEOr8o707aF6tibtwROZfqKR/ygDY4Bt2Nev6ETko5cKv
         lTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904317; x=1775509117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frztTOmTf3SkuLYaPWUosPvcRTJGFbSFXLD1W9fYAwY=;
        b=OCwMNXZ2HY6oY1EqhM4IRSX0riE1rP8+W1j5HHsrJxcBJWSHwn8XH7EADo4o3rN6u6
         7BNT00s33hPcbQdp+rNyMNDYVDYA3bXv3gXFwEb7pvSOCCJ/tIUqLlYzgnNS+/7awCif
         FlKQ5t3WXbOEi5eS/TfivXkMkXrgWoo8RYE5d+re/ALFN/QW3FtBVrp3k9HnjsF1vHmG
         e1LYdyAv8lph3K4mifCr6/NeF+3FOW5FEF7Ys/mGfnIcdJopMByHfswGBouekQ1fsL6F
         4Iuw91abQoWXKcUey1smr4XVJT2jFYD+9H5ARcBOyuaZNX9LU8hvEYtNGPgtXrGu2/Pk
         9Gvw==
X-Forwarded-Encrypted: i=1; AJvYcCU7JOmiitLufxZpcqjWgPNuuk6eo9W+E+U/zu4mqY4kOHTaPefjeiW38QeBsnKzlhn+r4j4Gn0U6Jkl@lists.linux.dev
X-Gm-Message-State: AOJu0YyjFakgHAjUlgFs3bU0+Ah2zFqWotcfY+AiOrzLdRlcPgVQWFx1
	Y66Nl3UqF7plclsB7UOu8OFH4F4FQYcLoMEdmyHR7YZZE1v1A31pB6Wwszqb6mHdbwM=
X-Gm-Gg: ATEYQzwQGfgZ2Mqs754FiTeiERrJMHQuCjoidgqBKzNAcQqemqBgkQK3zZMsgqyl7ul
	7kNYe9lEDtyKV7vwvsdCIuu5998R2Je9P82/a/OViPFQKf7eK05fmtVO3NLEGPF2mikBp1OPg+y
	oNgdo/sgi+F1htR6O7scxZ0Id2FojBxDZXn0QDLiFMJvbvIyqjfUfLx2Hdf6HYFWsdPUtqE/jAm
	XiqMyLX/Rw5ZsjJBjsyuSRx7AB9Vvt8R/fPEO/3XuM5uZH8q8TSJDHDGtRTTZ4qyiYFGpMHxSDa
	iFypqH8hO5j2JAaDmN3mv7MNxUdVzWp0rF5qN3UERS4d7huBMauWaJJWpvN0Q7SvcYfRwNOJ+01
	JnGGCi3Bb3YYXpn+OafQMsxi5jUmSTDPNtScp7a6gBGrwhf6a3eAB4rwoybBOYWGZ/HG14hQudE
	LqkKBNXSkY5XImo19fBLq/5kmghWk=
X-Received: by 2002:a05:6a00:ad88:b0:82a:6d9d:3f84 with SMTP id d2e1a72fcca58-82c96002905mr13353400b3a.33.1774904316640;
        Mon, 30 Mar 2026 13:58:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e8c9:5e1e:f42a:2b73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc6c8sm7426575b3a.45.2026.03.30.13.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:58:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:58:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 10/48] arm64: RMI: Ensure that the RMM has GPT
 entries for memory
Message-ID: <acrj-cKphy4hJsEG@p14s>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-11-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318155413.793430-11-steven.price@arm.com>

Hi,

On Wed, Mar 18, 2026 at 03:53:34PM +0000, Steven Price wrote:
> The RMM may not be tracking all the memory of the system at boot. Create
> the necessary tracking state and GPTs within the RMM so that all boot
> memory can be delegated to the RMM as needed during runtime.
> 
> Note: support is currently missing for SROs which means that if the RMM
> needs memory donating this will fail (and render CCA unusable in Linux).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v13
> ---
>  arch/arm64/kvm/rmi.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 9590dff9a2c1..80aedc85e94a 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/kvm_host.h>
> +#include <linux/memblock.h>
>  
>  #include <asm/kvm_pgtable.h>
>  #include <asm/rmi_cmds.h>
> @@ -56,6 +57,18 @@ static int rmi_check_version(void)
>  	return 0;
>  }
>  
> +/*
> + * These are the 'default' sizes when passing 0 as the tracking_region_size.
> + * TODO: Support other granule sizes
> + */
> +#ifdef CONFIG_PAGE_SIZE_4KB
> +#define RMM_GRANULE_TRACKING_SIZE	SZ_1G
> +#elif defined(CONFIG_PAGE_SIZE_16KB)
> +#define RMM_GRANULE_TRACKING_SIZE	SZ_32M
> +#elif defined(CONFIG_PAGE_SIZE_64KB)
> +#define RMM_GRANULE_TRACKING_SIZE	SZ_512M
> +#endif
> +
>  static int rmi_configure(void)
>  {
>  	struct rmm_config *config __free(free_page) = NULL;
> @@ -95,6 +108,80 @@ static int rmi_configure(void)
>  	return 0;
>  }
>  
> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> +{
> +	start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);

This will produce an error on systems where the start of system memory is not
aligned to RMM_GRANULE_TRACKING_SIZE.  For instance, on QEMU-SBSA the system
memory starts at 0x100_4300_0000.  With the above and RMM_GRANULE_TRACKING_SIZE
set to SZ_1G, @start becomes 0x100_4000_0000, which falls outside the memory map
known to the TF-A.  I fixed it with these modifications:

LINUX:

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 10ff1c3bddaf..21bfbbe2f047 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -424,7 +424,9 @@ static int rmi_configure(void)
 
 static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
 {
-       start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
+       phys_addr_t offset;
+
+       offset = start - ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
        end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
 
        while (start < end) {
@@ -439,7 +441,13 @@ static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
                                start);
                        return -ENODEV;
                }
-               start += RMM_GRANULE_TRACKING_SIZE;
+
+               if (offset) {
+                       start += (RMM_GRANULE_TRACKING_SIZE - offset);
+                       offset = 0;
+               } else {
+                       start += RMM_GRANULE_TRACKING_SIZE;
+               }
        }
 
        return 0;

RMM:

diff --git a/runtime/rmi/granule.c b/runtime/rmi/granule.c
index cef521fc0869..60358d9ee81e 100644
--- a/runtime/rmi/granule.c
+++ b/runtime/rmi/granule.c
@@ -209,9 +209,11 @@ void smc_granule_tracking_get(unsigned long addr,
                return;
        }
 
+#if 0
        if (!ALIGNED(addr, RMM_INTERNAL_TRACKING_REGION_SIZE)) {
                return;
        }
+#endif
 
        g = find_granule(addr);
        if (g != NULL) {

This is likely not the right fix but hopefully provides some guidance.  Send me
your patches when you have an idea and I'll test them.

Thanks,
Mathieu


> +	end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
> +
> +	while (start < end) {
> +		unsigned long ret, category, state;
> +
> +		ret = rmi_granule_tracking_get(start, &category, &state);
> +		if (ret != RMI_SUCCESS ||
> +		    state != RMI_TRACKING_FINE ||
> +		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
> +			/* TODO: Set granule tracking in this case */
> +			kvm_err("Granule tracking for region isn't fine/conventional: %llx",
> +				start);
> +			return -ENODEV;
> +		}
> +		start += RMM_GRANULE_TRACKING_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long rmi_l0gpt_size(void)
> +{
> +	return 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +				      rmm_feat_reg1));
> +}
> +
> +static int rmi_create_gpts(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz = rmi_l0gpt_size();
> +
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		int ret = rmi_gpt_l1_create(start);
> +
> +		if (ret && ret != RMI_ERROR_GPT) {
> +			/*
> +			 * FIXME: Handle SRO so that memory can be donated for
> +			 * the tables.
> +			 */
> +			kvm_err("GPT Level1 table missing for %llx\n", start);
> +			return -ENOMEM;
> +		}
> +		start += l0gpt_sz;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rmi_init_metadata(void)
> +{
> +	phys_addr_t start, end;
> +	const struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		int ret;
> +
> +		start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
> +		end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> +		ret = rmi_verify_memory_tracking(start, end);
> +		if (ret)
> +			return ret;
> +		ret = rmi_create_gpts(start, end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rmm_check_features(void)
>  {
>  	if (kvm_lpa2_is_enabled() && !rmi_has_feature(RMI_FEATURE_REGISTER_0_LPA2)) {
> @@ -120,6 +207,8 @@ void kvm_init_rmi(void)
>  		return;
>  	if (rmi_configure())
>  		return;
> +	if (rmi_init_metadata())
> +		return;
>  
>  	/* Future patch will enable static branch kvm_rmi_is_available */
>  }
> -- 
> 2.43.0
> 
> 
