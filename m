Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF63C2796
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871867; cv=none; b=u5pKLsNZU5IJ0vCWA2nrer9aIjmtgbTXM1Q6JBFcGcKcCGQtXaGTwL8/hux1dUmOzO4eti1YMIiBskVuB+jGxZ6YE0P8n0hPcrvmd6JRfhSxcNJdFh0pAT0jRhkMEUJKQHoLFgbBDnrfJMRTfsOYaUCyULfdsKcj7fIGnx6iRXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871867; c=relaxed/simple;
	bh=ZI9o4bTwAFLSUvqfJtnYi+jk/zWeAfwkgSPzM3bOjNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQEmqj27Ifw2KY0Ps6rI1/LM/QMA3s6b7TKSkhfDFvLeHc359fy2SvmywETX20kpvRQFMAD8dNhHz3mB6tcoryALgRK6a6S+dG+Q0OAbsTLjKUFFcJ9FCJsj/7ccaa0nbcwBLgOqPrD7JIEx9AjIvEa2Xsp8oALBg/K9+Iiofvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YcH9O59o; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YcH9O59o"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so6627625e9.3
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790871864; x=1791476664; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HYtyNDhTMSzL7NauOy9LXxOvJvUf8XAKFvjtNEOO43Q=;
        b=YcH9O59oB8eo1hu8C2reIQkaaJN6Y6tsI9Fpoa/JNH3Eon3SVb3bFHqkokD/HCsoH9
         BVT+4GKfq9M9/VQ86NgJTuRyYFc6qEG+s8jjlJO07koCGIuypk6en9TxH2ca01kAehGG
         wemordH9gRMHierztGha7kDsucQ8MdUkGIw0WADTf0U6kO4S6Zebe0N6ZUBKwtK47jhL
         nyvlYVAlTRHkAUKmw5kERns2wJeZsWMKA2zYYwSnkdjio1hcGw3bzZDiG3g0jnyjRWK+
         RBv9SZyvtqScFaA4ZH0L2gUQJQRbHGWDGpfhdZykoELF8YabUWjrPRiKETZfvdrxo84n
         n0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871864; x=1791476664;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HYtyNDhTMSzL7NauOy9LXxOvJvUf8XAKFvjtNEOO43Q=;
        b=S9bB68xAIBA3pYhw6zr8Z/cufooOW7q27JpIdaBqrrxK94/CNBqlZ1k0QRJpNycLJx
         COFG+RFvPBysl4Gp3WyH9AJG6YK2bLvVJh8Pknm305YcnQJlCOrD41RJ61pb3DlZGCK7
         8HKiX6IORF0+25Gh3o9AIQpBznV8GoaQjcqYf/KgrK7SYGdpx8zJgUALIuG3PrcVaJk6
         o9YkjE15FyGV1QysJ6GugA4p9lf4kQPRZk+HdqOKKm2qNAyy+t4oLbkD+7eQvd+wCGkU
         YR1gmCYbLeEgbRWd/2TY1fAfRXnSu8qD4PRgu5XQ+FYdbarXNH9bOXyzOV7GhIs0qUee
         gzEg==
X-Forwarded-Encrypted: i=1; AKwUvBy/57SQHVS5Lua4McDXS+9KmbuGyYywj+q8yYylmOG1LrFfLCYqDwf3Y1iZeNKLs62nl/5d0jn0k8pY@lists.linux.dev
X-Gm-Message-State: AFuF++mZ3KC5fWn0BEY/t6XFLfpMf3GCFSb03AgwmxSNlAD5xs0VP/8h
	iK3VnV1El4knE2GefcbnJJB4shU8shparQWAQpyAhc32bkfTYPhiV0uItiN2cLNzuJU=
X-Gm-Gg: AYBFou2tZUfq5rLqyYRQyXC1oJkdtl+9nEy/hcmp1hAoWcrk8hcUfr/AtWRbj8sjcok
	nAn9s71Ucy9hEMMtEbjKppDO1iUv9uQgtz+/wGwJJ1rcviUgGiRu0xVZa9vpO9TjVw24R82JeoR
	Og13ndUXr56vUdExubu+ZbVyYFA/JZoMMlXXmz2kZ+O/tpYJmvtrEn1FnJsjj7IWNGxlKWr8PwJ
	2n4S0eH1mH3X/TS0Hg0feaFAGf4jyjE0nEcFff9ib45b8rwE/LNGSwKrRL/Iz86PzKuxoeO8Z67
	moShfpjErTVTpUfzk7m6QxZ02fzpzR6LSd98pqtCLl3FTEQIoHfqj9x/smuDpiDw0ADEAe1zQAl
	xza7cQpD+9pZP+MLVP0Q75HPbrhwfNwokll7J7WHB6/TnomUwlZ17dhSlmtYfn+PNnaODmbcCHN
	uojXzQE56V/IQvYjeIvvaoDlLePbB0Tbumn8IUKvJjkZte8g0NVrQ4K78boq10//2znUroPS7LS
	Bw4R5ZkkZhl1cF332VVH+I=
X-Received: by 2002:a05:600c:34cb:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a0276ab18amr2182265e9.28.1790871863905;
        Thu, 01 Oct 2026 09:24:23 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm3061465e9.0.2026.10.01.09.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:24:23 -0700 (PDT)
Message-ID: <5fe666c8-55ad-4f06-b853-a532d73c35be@suse.com>
Date: Thu, 1 Oct 2026 19:24:22 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] x86/virt/tdx: Convert the version metadata
 reader
To: Chao Gao <chao.gao@intel.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: yilun.xu@linux.intel.com, binbin.wu@linux.intel.com,
 tony.lindgren@linux.intel.com, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20260930053901.22528-1-chao.gao@intel.com>
 <20260930053901.22528-3-chao.gao@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260930053901.22528-3-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30.09.26 г. 8:38 ч., Chao Gao wrote:
> With the helper to read a table of metadata fields in place, the
> existing metadata readers can be standardized on it.
> 
> Convert the version metadata reader: add a table that pairs each field ID
> with the 'struct tdx_sys_info_version' member that holds its value, and
> read all version fields by walking that table.
> 
> Name the field IDs for readability, so the table entries don't carry raw
> hex literals.
> 
> AI was used under supervision to review code and workshop logs.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
> v3:
>   - Drop the get_tdx_sys_info_*() wrappers to remove an unnecessary layer
>     of abstraction. [Rick, Dave]
>   - Shorten the field ID defines from TDX_MD_FIELD_ID_* to TDX_FIELD_*
>     [Rick]
> ---
>   arch/x86/virt/vmx/tdx/tdx.c                 | 15 ++++++++++++---
>   arch/x86/virt/vmx/tdx/tdx.h                 | 10 ++++++++++
>   arch/x86/virt/vmx/tdx/tdx_global_metadata.c | 17 +----------------
>   3 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 67a80ed86bd3..9d8a55a5da31 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -408,8 +408,8 @@ struct field_mapping {
>   };
>   
>   /* Read each metadata field listed in @mappings[] into @data. */
> -static int __maybe_unused __read_sys_metadata_table(const struct field_mapping *mappings,
> -						    int num_mappings, void *data)
> +static int __read_sys_metadata_table(const struct field_mapping *mappings,
> +				     int num_mappings, void *data)
>   {
>   	int i, ret;
>   	u64 val;
> @@ -434,6 +434,15 @@ static int __maybe_unused __read_sys_metadata_table(const struct field_mapping *
>   	.size		= sizeof_field(_type, _member),		\
>   }
>   
> +#define TDX_SYSINFO_MAP_VERSION(_field_id, _member) \
> +	TDX_SYSINFO_MAP(_field_id, struct tdx_sys_info_version, _member)

nit: I personally dislike adding this level of indirection, albeit 
rather shallow just so you don't have to repeat 'struct xxxx' in every 
TDX_SYS_INFO_MAP. Same goes for the rest of the patches. In the past I 
remember TDX code also suffered from, in my opinion, excessive macro 
nesting.

Dave, what's your take on this?

> +
> +static const struct field_mapping version_mappings[] = {
> +	TDX_SYSINFO_MAP_VERSION(TDX_FIELD_MINOR_VERSION,  minor_version),
> +	TDX_SYSINFO_MAP_VERSION(TDX_FIELD_MAJOR_VERSION,  major_version),
> +	TDX_SYSINFO_MAP_VERSION(TDX_FIELD_UPDATE_VERSION, update_version),
> +};
> +

<snip>

