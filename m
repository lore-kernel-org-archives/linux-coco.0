Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125290;
	b=c9ptq0Omi5oEiDaqFMBUG6NtIpe/H0DwZ3vpMMiQS0apspHn25gd8FYI4HtQkJlM+dKf
	 66xU6OLUlhzzvAWh8JOiF+h1lCUNjN160t1d8OsPyArlMZNUloKPOCziNKqBZSc1vQxwK
	 EjwnQUxnDMa5Aug1vVhU7PcrIUCJb10gYmLXIbhVa6CT6WdqZ7kNBdN+FHPfNpId3+YkI
	 dkBKza/XBfQ8QByrNge2swWIO2OQQcvE89sAUmfaeIn+m97qRCmY7ukfFZvBqgQD9+YYv
	 WIfkCa0myW7CwJYiCcMCM9/kEOIqkWUMBJtjMA/brz5zXeAshAotkGpw4t04CUP87GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9oWwO0cY+zSAmEBywqcvt5EowD1mRhhhpuanmPj0nj4=;
	b=E/OaCqQLsVKh9/QgXnkccvcHCvRQfQYC+n6AfT0+TAjHlSL8qSycTRGk6P1NLDr3jBJ6
	 A9k4AcbrvUKB1Fia5F4XlDY9boymen3+sZjXXNIPvZxBv/Ln2RhA3YyLP8o59qpbrJB+y
	 esE5ZV6tZXvrDxeBWQfKBzZ7MV1QOOsUcRnT+0jOX90iXHKBu3qG1CPINumcdW7VrDE/b
	 iDqUMdpgGmyEeuHY8q+rZ2kSbgxld0pUu3uvI1RHG4WbiCZJi9PLlgz/wmizD2uCIgLke
	 zQQQiQdMbUhe0O5B2ttH8k7UifkgmEu3rYSdWoLd5QCb3tJU+Xz6sGO3wSLse+MyTDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpAsY1N3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFF8606A32C
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 21:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEFF8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpAsY1N3
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9212a5a66f8so2462846d6.2
        for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 13:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795125289; cv=none;
        d=google.com; s=arc-20260327;
        b=jgGxk/CWnPTy0T2s+NO7+6RaBLITxsWqpcHi82kKn0veKObXx/5MiFeTsPu9LEA9VB
         Im3sMTHYcwfkm69kOXLicvqZ1YgJ5xqZQp+s93GZroQyO9Xs6mpKIOtZaw8J5HQmOuVA
         YagI+ahTrsaAfCPrnsQFyJlrGpJZH1c3GYBYKVJGqdBZorCrOrvvB3Oawb3PV9c058Ao
         s2wEBq7Aa/gWUNiZGMxGxta0nPtCQb5pQmApJBpmgq7vYIvD2cV3zyYzoVLU0AIHRXui
         mkxxLIcvnvjPzhHRn/C+Qg1xDzgXAHz8PjM6EoH2GxbDxLdldRCEs4GmZnT8CPwBBgze
         JwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9oWwO0cY+zSAmEBywqcvt5EowD1mRhhhpuanmPj0nj4=;
        fh=0CxwvbfvtGq1YpzOjU0gwWfLyWmuGMo8wjGGj5ZB7w8=;
        b=I04AIeLPUS5CRPs60tFwG16z/BThb9BpYeJmnR/09eH3G4aBOLR5pLO1A3UA5/qAu7
         9CkRT9pQbJh1OP5CYwjz/vshBSRnpd+YQhEZEbZ1XEc2sHy4XD/ti0a6u/NRDAbrCP2v
         tA7snRHGfkL2lK4vRtITOdmJU9ycapFbR4KGyz13CYrFhzuy3qvz89hG9+E1wlNf+Qev
         GTqPibUD15kkYtGz2k6TkD0jgT6gh5+ipXNiLIhN44i86FRsXX/52221TcOEZUQxP4E1
         8jr/K/Rqyr9nUsf6niE2mVPmhDg4vUeh//NcqyHqVnfZDbw2+6hE3tfpFc8Z+u6H8ki+
         HWrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795125289; x=1795730089; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oWwO0cY+zSAmEBywqcvt5EowD1mRhhhpuanmPj0nj4=;
        b=fpAsY1N3FV2Of70tXyWKQWKTu6xYGYAI33A/Ihax+6lWHI/OrFOXK6YEt+6vWaOHMn
         XJm96u7gYJ0v0KdIjABIehFX608zd5QRZhyEzbWQpaEI3xG8gEIpJsda5CQQz3hAIkj1
         iFn2uGcvQFOrWsuYLJo3tcD/DmUYbRumimCuf5OZtkgjIT9yCWzGfxx9hCr6/Y/HZI6s
         S1srAQDWFGdxnjZfmulXjJeasuEyAg1fkIfUI8xazQV5JhEffhAR6RDnenCVsf9Xc3fX
         OiuspCGQDVCUEOCq77UKTbnJGc355J2QsYxzOCfEc4hrfGojM4G+Xvc3FXQLOkYq+Siw
         6hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125289; x=1795730089;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oWwO0cY+zSAmEBywqcvt5EowD1mRhhhpuanmPj0nj4=;
        b=X5q9b0SI/UrfktMUqKLczkEkYtsGH3sL9nyGtd+oc4QfldaiyvifHUuObx1Yv7Z1cm
         8muP8zZ8JBHFxZcAzuvXlere4bUAhe/SkP79q2zVZjC4NKaQEyAS1WpK5oWVADVSTuvw
         dIIPRle49lioQpo1zDqYzyTbLlecGu1u0BEhTWDKjAQktirKobGSq0lCamCjHrf2KHkY
         x5RPL3UjkQgEYjNv4zSXeoW0d1a8FjIPtuBgrhH610IfZNrA3LuZfvSrJMDZ11znao1E
         ykkHhhv2lTEyCwoN1J3kPUJ5x2BVVN5yYRD8+aGB/2mpmtLYEVAxRxSHNt5aHQEAuY6n
         9okA==
X-Forwarded-Encrypted: i=1; AL+hErEQjG6+afcfX1shozHgmzs7WEtADvHHJBRW6oljYegWOYTaaiV1+GVs8JqIysfTCO6ifVV8vjb1NHD1@lists.linux.dev
X-Gm-Message-State: APuU4Z+huj8k2/jRofhSHlZwDshpA5GaxXrtRsg3ug9oUTVpymkMykbO
	rMu1ke4BrwONkCMmfjLJ5vUovN4RHfp9i4Gb3irvSUopmSrLBihcDbfgJiwL5DfvDpYKY5Q/nne
	KQS3jFcuectxU1s707aIHCIlUq8d+HxYtxcUkULcM
X-Gm-Gg: AZFdTZdV7QD+jMUHWxATwqRnU/lShXaBqmT8kKKwKf1wqVVnJLhanHl4bJuMSWjlEgo
	owAzkKj7LykkA1QySQbJgsEzMm5yirjzEg9t7JkAPofnu5i4oTc9aJe8TJpe6x2O82mJAzmTTNx
	MUJ8q3s1Zet0/uu/uPtE2GArqcsj88S9lDwbibBa8k3JSXUPMVp9ZAGtxV7sNyT2bw7Dkdw0AHF
	SBZmuTI5O/pYN31gS/TZ1GZsXcBLRWuIY0H77xw0fOXMxngXgzMdOUHGnkSI4bIHDidb8UPjAp8
	blXZciH5ktRqfDo6kWvv1GljSBSHJRT10jyjq8rabmzzQmwf4I+LsR0ObJnCA5t1hdVfotJPtdI
	/gOadH3om0ouFVKa0EI3yHcLdoqmx5QwzOpZSclsGoabXcxu1+PGOUalecPASzcXT9+6ocXdZz3
	e9bcNQc1YgNBZsVATKRk1Acg==
X-Received: by 2002:a05:6214:4018:b0:921:3369:a766 with SMTP id
 6a1803df08f44-92134a90270mr18304526d6.37.1795125287959; Thu, 19 Nov 2026
 13:54:47 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 13:54:46 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261112074120.1570072-1-aneesh.kumar@kernel.org>
References: <20261112074120.1570072-1-aneesh.kumar@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 13:54:46 -0800
X-Gm-Features: Aa3M54oXacZEF20KAAo0a9xrzHva6i-aYhx3GSm4FZG9y6dnhRg5XpywqLRfWns
Message-ID: <CAEvNRgFKfGEzMzAHCqGv4T3YdkjFbLKjuHW-CR9V0OzYRzTu-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v5 00/16] KVM: guest_memfd: Add a common framework for
 device memory providers
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev
Cc: David Woodhouse <dwmw2@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Fred Griffoul <griffoul@gmail.com>, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> Confidential device assignment needs guest_memfd to manage device MMIO as
> well as RAM. Device resources such as PCI BARs supply PFNs directly, and
> their protected mappings need architecture-specific map and unmap
> operations.
>
> This series adds the common guest_memfd support needed by device memory
> providers. It builds on the resource-provider API [1] and the existing support
> for folios and RAM PFNs.
>
> The VFIO provider, IOMMUFD integration and Arm CCA implementation are
> available together at:
>
>   https://git.gitlab.arm.com/linux-arm/linux-cca.git cca/topics/cca-da-gmem-backend-v5
>
> This series depends on the resource-provider groundwork from:
> [1] https://lore.kernel.org/all/20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com
>

Just a quick update. I'm still interested, just tied up with internal
work. I'll get to this as soon as I can.

>
> [...snip...]
>
