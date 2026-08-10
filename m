Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265753B5302
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356739; cv=none; b=ethVeTuY3YZIPXqPvk7HuYueNOIYMdDIzseFP4OVcwEjAMANHpQTjDW8NINZfVHs771fRqtTJrEgnBigc3LJLr131bFfVtLzWfDzuVRKYabFlyhDz/eP6gUOqDtkzXB9WA6l60ashm9HKi7JHbFSSfy+f1h5g1eL5MjmPVQA03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356739; c=relaxed/simple;
	bh=RPLcPMGi5N4cVEyILb76nzWqopMvCbsxLIxtlH2wYf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bW+dTQF0XkBWZvbQ7o5INttC+wy9MFAVK3eYpOpLg9DW3QBb7ROmYnVRugjjdWzyHDzUp4ZbN/TG8mDOV2xtU933dKuzgpR0S2M1An48OnQpBBQe4peN9v6+lQ/66LgQbaq07OvT0Z78PQsEKTfwNV7KnfPNMAcIPGyfnHtSeaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=U6n5PTg+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="U6n5PTg+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9906514BF;
	Mon, 10 Aug 2026 03:12:12 -0700 (PDT)
Received: from [10.57.41.8] (unknown [10.57.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B270D3F86F;
	Mon, 10 Aug 2026 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786356736; bh=RPLcPMGi5N4cVEyILb76nzWqopMvCbsxLIxtlH2wYf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U6n5PTg+J9NrdwhvH+pY29seE9WD8EiuUeRjXEapv3H0C3nX7hUs0329RKeJB7ATL
	 sxxzKKgAl410crPZ6K/Yja+TUvCZmwVQaJJK/ZFLtQjXbfhpKMveaehH1UxbJB6dSn
	 qsnkd0P0mDxpDBfMA79EfJs5Xo8m43biWprUDwws=
Message-ID: <baa99d81-7979-4654-a030-a550ba57bb58@arm.com>
Date: Mon, 10 Aug 2026 11:12:13 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] arm64: realm: Move Realm memory encryption ops to
 RSI code
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-5-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260805063255.1638614-5-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2026 07:32, Aneesh Kumar K.V (Arm) wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> No functional changes in this patch.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/include/asm/mem_encrypt.h |  3 +--
>   arch/arm64/mm/pageattr.c             | 38 +---------------------------
>   drivers/firmware/arm_rmm/rsi.c       | 34 +++++++++++++++++++++++++
>   3 files changed, 36 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
> index f03b9d7b83b4..ef8b8463e52b 100644
> --- a/arch/arm64/include/asm/mem_encrypt.h
> +++ b/arch/arm64/include/asm/mem_encrypt.h
> @@ -16,8 +16,7 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
>   
>   int set_memory_encrypted(unsigned long addr, int numpages);
>   int set_memory_decrypted(unsigned long addr, int numpages);
> -
> -int realm_register_memory_enc_ops(void);
> +int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt);
>   
>   static inline bool force_dma_unencrypted(struct device *dev)
>   {
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index bbe98ac9ad8c..14b2a3801f40 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -275,9 +275,7 @@ int set_direct_map_default_noflush(struct page *page)
>   				 PAGE_SIZE, set_mask, clear_mask);
>   }
>   
> -static int __set_memory_enc_dec(unsigned long addr,
> -				int numpages,
> -				bool encrypt)
> +int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
>   {
>   	unsigned long set_prot = 0, clear_prot = 0;
>   	phys_addr_t start, end;
> @@ -321,40 +319,6 @@ static int __set_memory_enc_dec(unsigned long addr,
>   				      __pgprot(PTE_PRESENT_INVALID));
>   }

This calls "rsi_set_memory_range_protected/shared(). Should we add call 
backs for those too in the arm64_mem_crypt_ops and take those away too ?

something like :

	pre_enc_dec_phys_range(start, end, bool encrypt) ?

and implement that in firmware/arm_rmm/rsi.c ?

Suzuki




>   
> -static int realm_set_memory_encrypted(unsigned long addr, int numpages)
> -{
> -	int ret = __set_memory_enc_dec(addr, numpages, true);
> -
> -	/*
> -	 * If the request to change state fails, then the only sensible cause
> -	 * of action for the caller is to leak the memory
> -	 */
> -	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
> -	     numpages);
> -
> -	return ret;
> -}
> -
> -static int realm_set_memory_decrypted(unsigned long addr, int numpages)
> -{
> -	int ret = __set_memory_enc_dec(addr, numpages, false);
> -
> -	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
> -	     numpages);
> -
> -	return ret;
> -}
> -
> -static const struct arm64_mem_crypt_ops realm_crypt_ops = {
> -	.encrypt = realm_set_memory_encrypted,
> -	.decrypt = realm_set_memory_decrypted,
> -};
> -
> -int realm_register_memory_enc_ops(void)
> -{
> -	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
> -}
> -
>   int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>   {
>   	unsigned long addr = (unsigned long)page_address(page);
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 8e716f1c1e31..ada139d0e344 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c
> @@ -127,6 +127,40 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
>   	return 0;
>   }
>   
> +static int realm_set_memory_encrypted(unsigned long addr, int numpages)
> +{
> +	int ret = __set_memory_enc_dec(addr, numpages, true);
> +
> +	/*
> +	 * If the request to change state fails, then the only sensible cause
> +	 * of action for the caller is to leak the memory
> +	 */
> +	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
> +	     numpages);
> +
> +	return ret;
> +}
> +
> +static int realm_set_memory_decrypted(unsigned long addr, int numpages)
> +{
> +	int ret = __set_memory_enc_dec(addr, numpages, false);
> +
> +	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
> +	     numpages);
> +
> +	return ret;
> +}
> +
> +static const struct arm64_mem_crypt_ops realm_crypt_ops = {
> +	.encrypt = realm_set_memory_encrypted,
> +	.decrypt = realm_set_memory_decrypted,
> +};
> +
> +static int realm_register_memory_enc_ops(void)
> +{
> +	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
> +}
> +
>   void __init arm64_rsi_init(void)
>   {
>   	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)

