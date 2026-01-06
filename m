Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AADD33987
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661907; cv=none; b=LvpgTfi9JDe+u9m7OSMUB1GwDFOPxNLZh4X05OmTxKNEbUTcm+pPUs2xw7hOcjcb24h8PjjKuiCfApbTVCzxIoCi8xQh81USabRtzeaQbuEDNDGX0xVpa40oG3CcWDKEB1r/zZWbug1nkmJ9fqQWgOhTtfZSsh2ikReRkULIZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661907; c=relaxed/simple;
	bh=7QxghaDm861CKYRDD8kHL8SgeDsapiSRzVIH2YrlMbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmmAPL4WP3cMUIYUpJOY+3gCw3KNOdtwseCvYhb/8Gg2NnJTCPwXH4tpnOA0poeYkBofSQmqqmxexaFrqt2WqIRPcwP2qN5qJMBfSPTrK13cITdfOYwy4Nv+L8P0K1hue18BlmvPdc5eRQopCcL62gGIHEfuR/NT7yodz6TX1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=grWA8b60; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="grWA8b60"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2a4b6876fso61032385a.3
        for <linux-coco@lists.linux.dev>; Mon, 05 Jan 2026 17:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767661905; x=1768266705; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0M6wACUwu7ZPlV5A2pQScdlqF/ktZzTx82xX4yJbmJQ=;
        b=grWA8b60nOSm6T2Ip9v7bQYmYrsyDz25Aw0kBG+cWp5pTp/FKTzJgHKUTM50PPoD+8
         wQny+iBPQj4aK57oYX8ecUGkDVhQ4r/Z45ViY/Ie1jitfut1oJciYqkkS/hF/sNmRsdH
         nUsItyHoxqakhjqUY9nxDOQcMosS9H0yp/g2KoR7dftuLVooefudx0hRnWnV/ktBaUHr
         QOmQs3vxbuG2gHM8rxTQFzrAcQnr4DuOF/cbQ2CUcEnjOJDWgnI4NGh3oK8avkfXTEKj
         b9ST8Q8XJdMly+J4kLfdsHj2djx5ydp94abLE4BnYPnzI0XtXiyMKEjs6uyppcvQJLRM
         jagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661905; x=1768266705;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0M6wACUwu7ZPlV5A2pQScdlqF/ktZzTx82xX4yJbmJQ=;
        b=j+6/5qnLCDfAYh0JFCH25OzjLq9kL2m3AVT5im5084XWFFSCpLvQkWvx47j2MqXkGl
         arKoCp09fPY1pqJcsTVu7wWKNvMVPmBeHjbXjymGErfkKQDik6VlvrI9j+oa9gV7vQpf
         SfDNKmESqlay8sk2kbiDmsr7rNDx7GW/o/+oIQNBQg57TE3SDdpUHLqCzVZTquoBXYAi
         lJJCFhY0FMW9C0rRG0TEU1WMFXvdpvHie0Lt85ri/U6Wd3itWt7U5KgE/Gu7FVqsbNmV
         Dg9rvyk4UQG4FYxxaC/Jb0UiDt4xYcZK1Vy0qLLxYt9wrdABSM0m5PKPyDzNYuf9+SMF
         1mOA==
X-Forwarded-Encrypted: i=1; AJvYcCWDga+QbEiSrV6zUP72qfOcRhhTQvCdTxQVdAMLt9DVfk8lFZa6Kw8bwJQmbPh2xGb+JM9K8Ob/NqQc@lists.linux.dev
X-Gm-Message-State: AOJu0YyXEfN26a00KpkebHHkjAtsEl8NRjiPZpQL2kPAEbrSUk5HP6DP
	tovnSNRhIfOEoB+STjGOSIwglTjg20Mha5KDVIrsnskFz6ejmzZc7yFY9TtFDQtvWno=
X-Gm-Gg: AY/fxX5+Xm10Ygy9ObM9AvKF30if4MCPakugrhucI0ZrI1LN/uL/K3PINDHFnkHx0Vz
	4kaRy7cJt9+PwfGI1s6vSQyFFW15yZTBxdoNRnVGfZZrw8AG/LyX4Ry7BBroxqjQsb1zkShd07p
	o+leFB2SLtcdZ297tjr9qmHbYE/Tqo4Pn6erJPS9fS1x4NS1vRoV6jDRll/3r2KzeNW7tXr3yrC
	zQfD6c4vG8mnc8vIqku+n5MkGjMl/kQiCKhpcuNm8aSRYeEMpSAzDARBJGcYhUqnRfEpFnx5sNI
	1gJo+LTyvCZiTR34fqyXugCZJBAC8ETus64HIhhbwSXfpIRXHsbt0+q+Jp4S6liz0Acez1RfWfL
	g0IRE/mdJdktoCSlGPmMscNQCxPmjvRDLN4nSzBkPl3AFDYoVZLK9FR8H/t+B5RaQjr0UNKavwR
	iMiGUq4nPKw7W2lS2/BqAAyi3OLP599COQcjzxrd0FBbecUgqvDmlvrk2RTX3EjlBtkIU=
X-Google-Smtp-Source: AGHT+IFxbvXmsKhVoiNfeU0gqUSCgEVUTzTPmXjaEEUemMygzC5mzPD60qjzhxEZyV6lPJlPXUhCBg==
X-Received: by 2002:a05:620a:7105:b0:8be:e044:8cfa with SMTP id af79cd13be357-8c37eb8143fmr221733485a.40.1767661904885;
        Mon, 05 Jan 2026 17:11:44 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4c964csm67177785a.22.2026.01.05.17.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:11:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vcvbr-00000001Ecf-3FnI;
	Mon, 05 Jan 2026 21:11:43 -0400
Date: Mon, 5 Jan 2026 21:11:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	maz@kernel.org, tglx@linutronix.de, robin.murphy@arm.com,
	suzuki.poulose@arm.com, akpm@linux-foundation.org,
	steven.price@arm.com
Subject: Re: [PATCH v2 0/4] Enforce host page-size alignment for shared
 buffers
Message-ID: <20260106011143.GP125261@ziepe.ca>
References: <20251221160920.297689-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251221160920.297689-1-aneesh.kumar@kernel.org>

On Sun, Dec 21, 2025 at 09:39:16PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Hi all,
> 
> This patch series addresses alignment requirements for buffers shared between
> private-memory guests and the host.
> 
> When running private-memory guests, the guest kernel must apply additional
> constraints when allocating buffers that are shared with the hypervisor. These
> shared buffers are also accessed by the host kernel and therefore must be
> aligned to the host’s page size.
> 
> Architectures such as Arm can tolerate realm physical address space PFNs being
> mapped as shared memory, as incorrect accesses are detected and reported as GPC
> faults. However, relying on this mechanism alone is unsafe and can still lead to
> kernel crashes.
> 
> This is particularly likely when guest_memfd allocations are mmapped and
> accessed from userspace. Once exposed to userspace, it is not possible to
> guarantee that applications will only access the intended 4K shared region
> rather than the full 64K page mapped into their address space. Such userspace
> addresses may also be passed back into the kernel and accessed via the linear
> map, potentially resulting in a GPC fault and a kernel crash.
> 
> To address this, the series introduces a new helper, `mem_encrypt_align()`,
> which allows callers to enforce the required alignment for shared buffers.

This explanation makes sense, but to maybe bottom line the requirement
to something very simple..

 In ARM64 the guest shared/private granule size must be >= the
 hypervisor PAGE_SIZE, which may be larger than the VM's natural
 PAGE_SIZE.

Meaning we have to go through an change all the places doing
shared/private stuff to work on a shared/private granual size. I think
this is not just alignment, but allocation size as well?

Jason
