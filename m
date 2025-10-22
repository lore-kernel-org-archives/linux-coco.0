Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E782F39DA
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128490; cv=none; b=STpN4OGy8E5KuE/r8m0ii01MW25UJ/jTnYOYT1+OWZ6jxxUBznFxsHqzqK/DF7aS3et892FrO0z71RglZ7d6Jq/5nFKVNkSX6lSOqThuJnAVTCcVf5HYdesg/j7FuGQzpRAZ1Z2kkdBMi0mrwnvJhkoRNHzuFZAyUYy+tr0nLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128490; c=relaxed/simple;
	bh=XWM0x93xkrYFG4pt9tNpFC6JPUavKJAztnBD41QaxP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtmulV5/tkKhWk9UyweOL5c7XtDTADRJ3H8jbzOPKkoiznplc7H0/ZuSaCvCVpRxY9NfVTV5yXx1pWEXXtOCo6ZbiZRXYQvy1NLwdOtmT5HNg+YwuCRnWp0FdTLowGFmCo5EjZy5SWYhk0OJgFzBwoKZ31xEm9jTRNRpqx01MBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R22B6tp4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R22B6tp4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47117e75258so33388305e9.2
        for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761128487; x=1761733287; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk0X5dyXnaYRQ0pFrTanoUjd73DEmoFGHQHkS4CZEkk=;
        b=R22B6tp4HiMliui8crbC379jCdcblfbQSz26ze/IA37K66oMc+9yn5trXQ7sVmgpP2
         iGgoJ9FMOan4fB5mOINIr4lzKRH0DefccbpBPFw4Wox3EfCM72uf1SGxIHTLbLOTrar5
         ggXSh6azbfQrVUpV5nZhwH7zqbabN0EJ0YDxU+S2T287aKzPjkwxkxHnpPOWPblFYQqK
         mHj5XLeM8L4kxVN4LeeFdpuowaMwjosk1gaM7Am0SuDt6AmNcQkZCfcfb9QME/yM9FsG
         N4Iiqz7UCx/NHkAwMHwHuUPozbn2AKGCh/IFalQx/e08kguloMji2GCznGz2FAoBePXA
         wiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128487; x=1761733287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk0X5dyXnaYRQ0pFrTanoUjd73DEmoFGHQHkS4CZEkk=;
        b=si8tzKun4VWeHsuPkRvjuchgs+E76ljHgOYDe8emsFhHg+cNqDt8NeN5VhPFZhvj+f
         asp7efrK92bs3MXJuoZNolVmmmIZh8UTvnyT/xdxewtK3jKCzPidwx4cbXAuyW0TXCw1
         6+WOc6CYfC+qqKlWCVE5QAMQdYeYM9C6x6TQr82iOC3v5FVlUNhO3oEgBJg+/qZhKqGL
         /x3ikwTTONOXUeGdW9e/T6odvBC8inurAGDnQLIPAglml7J+71PTBiPKU3riV4t3zJDp
         dSiBklpcm6sgPZwYLOcdjw0bqSIsUos1FQFVxY7vuWfhitcEUyzdUJhZpmBFosNdtLWu
         qivw==
X-Gm-Message-State: AOJu0YwC8a9HeEt7+gJWuZSitt4Bb/5azN2h6fWpmrASywXaaFR/YSb5
	kGPyh5foCamULgOdROTgho1s5FZOB5LudhoaPnRCVEDotrC4AOpgxh9Zcs654b4HWdA=
X-Gm-Gg: ASbGnctOyAVJCwUSM3d8aMnWQxCM8OLeUzFT/frtU618wLp5yLFPMcIUshOXMh1fQHl
	LWtFFw//sJz7TtMnFj5S+tiaLVKS56quYZsWM31jMFeS7BzdPB0C0WUuiO9YOD51m8F1cOjXXmU
	7QOWlwlZMplHJniTbyzgY3jEfCIPhpbg0dFe1zWFzMB/5kM7264djYTQkF6omJtfhlGhpxBAv++
	+wpSKC3noHFUNu8OYsq7EwihOo0m19jDcD7O9a3QB/LjvjzKYxWHB/XBbhKSLde6l1rXODQMCa7
	MjLsg5pZuZfYlvkVpnNYX4NQsIzQf3oGDCOAHFzhgRVedvbBY5Y1dmTlLAepFvmlUsm0pB2r80a
	aZ/7xUWCJBDppDUmRxmMHLLLxtOS+LKDWF9a2qHkcy+1ZLmSfPpwU7pofij6IQdKlhtRspTewPJ
	fKvbet0pv7xZ4oK1UvbrH6+ZjyhSc=
X-Google-Smtp-Source: AGHT+IGAf5CMf3gPJvFPFHsFzllthcJ+DuRR2ZZPQ1npJPtus7HB5paTcmiqEKltsOP4L0jr2Tw1xQ==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id 5b1f17b1804b1-4711787350dmr119452765e9.1.1761128486587;
        Wed, 22 Oct 2025 03:21:26 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.142.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4281314sm37175075e9.4.2025.10.22.03.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:21:26 -0700 (PDT)
Message-ID: <d8bdeaa7-3bda-43ea-8b98-ef4f23d0e7b8@suse.com>
Date: Wed, 22 Oct 2025 13:21:25 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
To: "Huang, Kai" <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
References: <20251022093644.320207-1-nik.borisov@suse.com>
 <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/25 13:14, Huang, Kai wrote:
> On Wed, 2025-10-22 at 12:36 +0300, Nikolay Borisov wrote:
>> _seamcall/_ret/_saved_ret can be the target of indirect calls via
>> sc_retry_prerr/__seamcall_dirty_cache so on machines with CET enabled
>> such call chains result in a  splat and a BUG():
>>
> 
> [...]
> 
>>
>> Fix it by adding an ENBDR in TDX_MODULE_CALL macro to cover all
>> cases.
>>
>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>> ---
>>
>> The kernel this was observed is a SLE, however it contains the current upstream
>> TDX patches. And looking at the usptream code the problem persists there as well.
> 
> Does your kernel contain commit 0b3bc018e86af ("x86/virt/tdx: Avoid
> indirect calls to TDX assembly functions")?
> 
> Some history about this commit:
> 
> I firstly found __seamcall*() could be indirect calls in some randconfig
> when building the kernel, and tried to resolve it by (effectively) adding
> ENDBR:
> 
> https://lore.kernel.org/lkml/20250604003848.13154-1-kai.huang@intel.com/
> 
> Peter suggested that we could use __always_inline to keep compiler from
> generating indirect calls (which resulted in the above commit):
> 
> https://lore.kernel.org/lkml/20250605145914.GW39944@noisy.programming.kicks-ass.net/
> 
> I never met __tdcall*() could be indirect calls, though.

Well, adding __always_inline to sc_retry means it will be inlined, but 
inside the body of the function you do have:

__seamcall_dirty_cache (which is also always inlined) but in it you 
have: return func(fn, args);

So you still have this indirect call, no ?


> 
>>
>>   arch/x86/virt/vmx/tdx/tdxcall.S | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/x86/virt/vmx/tdx/tdxcall.S b/arch/x86/virt/vmx/tdx/tdxcall.S
>> index 016a2a1ec1d6..a2137cd7a669 100644
>> --- a/arch/x86/virt/vmx/tdx/tdxcall.S
>> +++ b/arch/x86/virt/vmx/tdx/tdxcall.S
>> @@ -43,6 +43,7 @@
>>    * TDH.EXPORT.MEM.
>>    */
>>   .macro TDX_MODULE_CALL host:req ret=0 saved=0
>> +	ENDBR
>>   	FRAME_BEGIN
>>
>>   	/* Move Leaf ID to RAX */
>> --
>> 2.51.1

