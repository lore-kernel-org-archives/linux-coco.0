Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A33C1F43
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740689; cv=none; b=RjZEeuZ7DJqeDOCqxm4UvH5LdbawWczheWwGOIglb+zV6XuqBrTB0tlvgw/LefjSKfMRQ52Au7YgXS+/8LhUoV1wOmfyxMHTqZDFJNhlzQ/yovXmmlveST3Ys73aN3h6PU07W0ju99qnSOPBDhyt9nE78l8vGDgb2Cjqq4TicXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740689; c=relaxed/simple;
	bh=FirHhg80SM2Cy3E16gU/PTYMf8PSKE8oZZXWjAxfTyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJtjojXytUtiHJ2GOnJBfb6N/p0sZPOMUcnIQTUmRy1UD+Lvujh08h2fAjvlAACrt/IFLSTNHC+bGW3tYKlmcSgIJorTc57kpNAA4pCuoBsuUjxvZTkiXXwYG1lCTR5BbF6BvsEh8kLZBYjUKcuK53bYtNq+gju7+drtFwhoVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eAitPXC+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eAitPXC+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so111012466b.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 03:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787740684; x=1788345484; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2ulPxX+xAmNAkYxhHD7oUU3uVjuocDi4uCbS4PhtOo0=;
        b=eAitPXC+JjQqu+fE+sB+kEAehYIv44Sw9V2/S+YeVJQut9F1n0U++1g1czoANrsGud
         7oSjWaLHm8bAkwxqyMuQr5ja3yevhxRPTmt6lwwG4BjWHmQfXdomaCaczGCtfcGr+ySL
         UXvz5/36+0dTuBFYn5RKiU8t6XdkfJJQlxItykjQM6jHLkk26d0vWo0GvCQXAv71vJ8Z
         pCzUOlX0LOzdJpUEhusPmL9P8XbPgp9hbFz2sl4bYCZ/MzDGKQzsgshwqoqo0eh9LnzS
         XrWnJzFA9C/lITUm01pam2/mygrk/8mghIY/4AFhdSldfMKm4tYANlOKGnWuB1Gn+Fk2
         OIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740684; x=1788345484;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ulPxX+xAmNAkYxhHD7oUU3uVjuocDi4uCbS4PhtOo0=;
        b=tTdxydFUZLvyLSHJANOUACMmTOor50J/NLfTam4jvsx9pkt0+3am06GkJirxxZnNgn
         /CmGegtUqYmbE68psZxSejr7Fg2D1+PxAXx/eaQm6zhOD1Nv66h0b9gOJKR2z9DajVp6
         VwQZQwKHZf4nZSYqFJbt2ekpoUF18fP4ywt8M515T19YYTNEk4F0stfrKUUT/5rcM9Xy
         kdRv/waxhGBRzw/Z2XJVnl1xRw+zx0m+89zv8+rHY3QQ5gR3JnqyRfw25MnISQ0WmUPm
         VsHgsPMFdU5sRGLTE9iM3maDxNzRKVG41IBIhJEnQGaE5huHogIqlgy4iymyMKvDgyZV
         tKnw==
X-Forwarded-Encrypted: i=1; AHgh+Rr80iB+Nut9hQ6P/+wyFfXQEdYj5Vpgh+tJ5qrVWkWQZBpdi44KdfurAbz45lA8ic6dFJBhuwKp4szX@lists.linux.dev
X-Gm-Message-State: AFuF++m3N/xmk4uWbfWvthYHARmAnO/Sm1ZR0ug5PbfcXba9xFl15T65
	jVUOHqBe6ZnwDbnjhoSYDwzM4B/AaKQSiQCokJaZv4D6YIWQvx7l91LZ0dVG0A85HWs=
X-Gm-Gg: AR+sD10IgHfX9Yn1DbaYcCLel1AIky4fuWNYCJU0RqFmit2eSWyKuoixPxEu6eS5wE2
	hHRNE2lTLQyUkKHIcbL7fIfq9ZkgbAT5k89YdyCz655eNeNKZDL2S6gYskkjsrnq081fwMmIr11
	E3DTYUUZHJIZUMAImQCuAJmTRPUxDkp+VOlDsVRlROupIQe1IxGjr9EAjB1RPOhm+eLuiqP0QFK
	vtvqQZSew6P+o1onBJcCwe6WUG79B6rg7qouk5nSUGTis2/JIiE9LZZixbnNcyvx7xUeeoq8NNw
	JZoHXJBA08MWq8bJqVTAhgtKZZeiDWlst5p/caDtprsY1NYH2roiB5xjV0+cDkwV1rs3yligcUk
	VEpv3F3DGZS6UiKcorUYPR4c7ME9KOKu8/q6zXllisBu9UfG78/RR9spB7bpk4cGImfEKE8eGHT
	mZvCM7iseFRwELMkschp1Ujkwq6ng467tflcbjjPAMphjaHyqH+KJUF7QN/GV0Ycc=
X-Received: by 2002:a17:906:ef04:b0:c20:af9d:454a with SMTP id a640c23a62f3a-c250c36aa50mr709758766b.16.1787740683782;
        Wed, 26 Aug 2026 03:38:03 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b6412sm3539135a12.2.2026.08.26.03.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:38:02 -0700 (PDT)
Message-ID: <55105419-bd0e-458c-ae47-90859fd78da0@suse.com>
Date: Wed, 26 Aug 2026 13:38:00 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] KVM: VMX: Make handle_bus_lock_vmexit() a shared
 helper
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-8-xiaoyao.li@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260819094903.3060020-8-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/26 12:49, Xiaoyao Li wrote:
> Move handle_bus_lock_vmexit() from vmx.c to main.c to make it a shared
> helper so that TDX can use it for Bus Lock VM exit handling as well.
> Rename it to add vt_ prefix to reflect that it is a helper for both VMX
> and TDX.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
