Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6CF3C3F55
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740722; cv=none; b=SdF1es1PwEW8lC0P1hCQmtOFLjXvJZQtTWDbEE1FET170wI0mDOgDudUKCNNrd5wuCBocr70bNHB1Ns/+laYRJuNehvPVQjTmPDv7LkxHXTIM7TeDrOJK4gE+W2VzBxNNJhEN1xRRGtdPI6aEPbmIIFTFK4t69BOVpuuSYK4Qx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740722; c=relaxed/simple;
	bh=9ODH0j+pPKWhlnxnLq/3i3vkRWrKYUhxq4heFKzjTcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEEw1MzJdfiMFn8s57vcYpfb/FivvIaOM/Go2+PAYTUMJt3HH252zIQ30WIHBoTzMVnqzvDqbd6S+2w93guKJR2xQiGNoqTvD83YiwM6rdYrHtE20oGOmJLpwk/7MwA3Uq4PHZMxQYegERIct1iStFSyLzBKtUg32tdTizfnE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BFSQt2oU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BFSQt2oU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1670dad7a8so120529766b.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787740718; x=1788345518; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9X1CxMBr6pkoiGtqceoNp11tbBdjlGhMlFbZkegKSiQ=;
        b=BFSQt2oUruqkoHIgvEKCrPiBPVpLB1z5qBh+NC8M7do3P0aVHlJObxM8Ow7O0+OZvf
         ZzHbk1XNow2JvtDUBwcBY42R4LzuUwy0cusWur8byxLxqnHY5qFwuNT2auAXMAiMFVYJ
         qsKEFLWpaKcrK+o2Z5y5JAJx8iqWc3PZtVxRXW2BGQwf7siBJRutQLxrpcFsq6SN20nc
         yNB6Dz3MMbG9akc2hKEdibf5TgGILthd5hoMX+mOP9GKm8mUFmPKhYoqQzARwKPzsBee
         Tipcx5OP940j1gGcX0g/X0RMPWkQlyfkLWXrTyldUMa16sGjOGj/y1qKDgJmKny2/N0O
         QvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740718; x=1788345518;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9X1CxMBr6pkoiGtqceoNp11tbBdjlGhMlFbZkegKSiQ=;
        b=tIfaBmYPOXGlaigRpT6uITIjH1TFzjTqnHqogwMyy7mRwc6jL6m601grs0VGf6gLfT
         yOv5tNmc0rw8OPaejW1JU1eMfE+jgj0fANWHdn9LKGJkofxowNJW2pO336G52yTbqqM1
         nmKkbV3iEi1nBCG64dGt22GT3TXKMuPsIIWlVfKxf08Crd5+UxgTDI8m9Q5yRTh+vEDM
         lJYfEoXASvtDT4jZLVF2IjTkCygBKXLfnSQKlV+fBMYmrCh+jnahpeb7HoZC/oCOgAwV
         M8iEvRL9pIQZ9vtgUOMA2L46js9BvZMDnb4RARK/8MAwDCzhsO2QjlTVnAF2EcWr1mAK
         j6bg==
X-Forwarded-Encrypted: i=1; AHgh+Rqz+lVmhiuOQVxrRlTtNv3wgo8UVg4jg8ROszS5OrRUJyL6aIomPjVgIiVHWZkUe6/3dRGSHpAiggVF@lists.linux.dev
X-Gm-Message-State: AFuF++kbp0q8R78NPb0LX7GB2YaBL4e7FuLr1+tD7Hcl2L2fEL/hThcR
	Ndy2K/0Yqkk27TkvjyweOALzvuEu1kZyRW3hBpG1PWMtHuNnyOl4hp2dy9ReXiBfpMS/Z8n991w
	gSy0d0fg=
X-Gm-Gg: AR+sD11OnXxuVr1OovLJTQGp8ycalLcNDrE4r5hS2uXrJuoNSfPttzxrSng0HqOBPlG
	jxLq3mmHQw9vW7fvec9Fo5LUINbJAQSH33vTm4p5qskOmidlvt6IEJYtCzfHvDIn3alllK35xY4
	VLtwEq+brjETRjbfNdnmcF4P8ADyIQezN54fIxLpjXspMz6BBQRAYEc1sJZVijbqpFBG9Tn1/67
	EDMRJbnTyNcb4/YNe10cMSdGOzZN8p6Y94j//Yxxw+544Tl3KiGPz8hRbMq9fQqo0s6Yer5t/JU
	shdgmDU/Hbh9rZxPw/g9Fx8EIgrPYz+bLBKWVatKOUK/z+VNjUfNx4CTD+WGzpqtayWsaAleBAB
	W953BJqs5Y1vgNoJh5jX8KmNV11SEZtLAn78eK04MCtY7VVOJALCywjXf+1iI4BEndql/r90N3B
	iCMcT1Dqt5njRPMUjl+++P9SHoJtKzACqF7YkLV3NMBIII6cHGFr5TDUbwgYpCvNWgXmAZcNAz1
	g==
X-Received: by 2002:a17:907:d0f:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c250c363717mr798929966b.14.1787740718389;
        Wed, 26 Aug 2026 03:38:38 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd676sm442484366b.17.2026.08.26.03.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:38:38 -0700 (PDT)
Message-ID: <a1e021a9-b8a3-4aab-862c-21109648cbbb@suse.com>
Date: Wed, 26 Aug 2026 13:38:36 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] KVM: TDX: Enable Bus Lock VM exit
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-9-xiaoyao.li@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260819094903.3060020-9-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/26 12:49, Xiaoyao Li wrote:
> Enable Bus Lock VM exit functionality for TDX guests.
> 
> Bus Lock VM exit is an existing feature supported by KVM.  Userspace can
> enable Bus Lock VM exit through KVM_BUS_LOCK_DETECTION_EXIT when it's
> reported as supported.  However, KVM reports the support of this CAP
> just based on the hardware capability but doesn't differentiate between
> VMX and TDX.  This leads to the issue that userspace can enable this cap
> for TDX guests without getting an error, but the feature is not actually
> enabled because KVM doesn't call the TDX module API to program the
> relevant TD VMCS fields.
> 
> Enable Bus Lock VM exit for TDX guests by programming the
> BUS_LOCK_DETECTION control in the TD VMCS and by adding the exit handler.
> 
> Note, there is no enumeration bit for this feature by TDX module because
> all TDX modules support it and allow to set the TD VMCS as long as the
> hardware supports the feature.
> 
> Fixes: 161d34609f9b ("KVM: TDX: Make TDX VM type supported")
> Cc: stable@vger.kernel.org
> Originally-by: Chenyi Qiang <chenyi.qiang@intel.com>
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
> Changes in 4:
> - The code to make handle_bus_lock_vmexit() a shared helper is split
>    as a separate patch.
> - The handling for wait_for_sept_zap is no longer needed since a general
>    handling for it is added as a separate patch.
> 
> Changes in v3:
> - Refine the changelog. (Rick)
> 
> Changes in v2:
> - Don't overwrite the negative return value to 0. (Sashiko)
> - Clear the bus_lock_detected bit when it returns early for
>    wait_for_sept_zap case.
> - Add a note to clarify the feature is always supported by the TDX
>    module, to make Sashiko happy.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
