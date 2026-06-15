Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15602AD24
	for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 23:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566438; cv=none; b=nsT7tmhuXkgXE2L3+lQFPoI2oJwv/Muyc2HWyeRRg6XsWlO/1fSs+nBVghT9H5DaXcjzpMf0Vel9iOko7niyQcgqXAj+w7cQNvaSyXYYmPxM/yowz/BURQGT8ggMAsqkGodeQBMlpfsBCSMz/kZl28HIJH90hBRek4spu9NPhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566438; c=relaxed/simple;
	bh=wkWq1YyQe9HfMn5h5fwETvev7LwtmAAMc8+W6YYydmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyJNh5KvKmZbmjunjpJ5JjUb1IZogppHVnZUjXKt+Hc5gDPQQ9IfhRBfDyJxJFCiaXGuv/t6+n+B/QlJfNmpLb1omiWF2Ru2l+0S4WBnvBldw/wL6eEJfdljf1c1KFVrokjEbKO3FOxq1qz7VK9fsT31pqDgbjq3olIExl9L1v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CuvDOmCO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CuvDOmCO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2d865383so12725ad.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 16:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781566436; x=1782171236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RZpXrhOisaz0Hy21Y75kOiIkZX6dkWHiipcMDxVBGY=;
        b=CuvDOmCOlvCm5NJLSbg4tXqm+pWhNt56SkMHXY1i5U6uFfLZM7agrcFL6Zmc3D7Jv1
         UtKabPdFsBLFdGTMN4/v2IaQcASzKCKP7jl2mJ0mMwWHDJleLUU9p5i2J2AqvRVOOKYh
         73Lkgh+zd97sXVXUAx3Sr/PySGOz/Tur84GlLJkBTb2+flwMSZpGHkQ4WPhQ2iAnCckn
         CXqALa8Ps0EMv7VYwN+ktYl3SD7rQMI6AxdRB7Cp4XFixLODiP/heEIMbAatDNvTeWGW
         JLyd1G4x4S4XKqPxtamhMLzNeh/q3An6Il9kEEPhLbh11gvXoWNIxAyHacxkI2B62wn+
         QrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781566436; x=1782171236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RZpXrhOisaz0Hy21Y75kOiIkZX6dkWHiipcMDxVBGY=;
        b=ZuJzjPZUQyRjlTNT8wlJVzQEbGXQ+HmsJNCp6xI9FOInIMk6MwnbgRR7ZJowmk9nUh
         kqNDvQgmiM+w+3dKyqJ8FHew4miFai9OXgwrYAfF7nMPKnu20z2qsCeNNARftpdAR1e/
         TKyg+OlckCnNz4uzJz/GTy7N5HJRVYq0Seck2D68uk14k5Gg/oZhLU5Hd8feueyIF6ci
         HsOCbyWBPLYXeOs73qyRjuHye4/7uLm6Ov+1Sg7TP1/cU6dMpiV72pTbbwWoUFGeA9p7
         uj91SWy3VEsf9hLnIjYJ+7YIbhZL6nrAC9ZOA36Yh9K6qBTg6fMEDx2ePK9HS6oeEEij
         /gUA==
X-Forwarded-Encrypted: i=1; AFNElJ8W3Tpbpqb85so/1BFF6gmG7BQGW77seqkxinNxtCWiyS8cp+jtIO/6KZDiVQ3rt+YPFWc1Uo7R6OQK@lists.linux.dev
X-Gm-Message-State: AOJu0YweYbZXg+WUclOrILTX+0j4t8hEXNt4kcNRoYBsCo7o3YJecWAH
	+auvG2zco8pOitMRl0Ce4IOSXz3I3Qwr7Ru1FSSiNQbQyCpzPVGKFMJeY/E1OOzt5A==
X-Gm-Gg: Acq92OFTh82dF7W5G/rToD+sL3dHpboZegM8scuRA0BeQ+kUez8fktbe8KwwvoOIORM
	yCAnUV6qn+SEuWiIJIssXwORY6KSNzM6rEBqaK53KfDwPGF9ar85d9gxVSXHtSnrq2xPZxZkheZ
	1Ei/gg58MGEEPCSYK7PmgV/AO7QNk9iWqsP6FVeoZfZB2YcaRXI6OEHevnFuBDMa4nKRtyKUACE
	svnCgXQsvHcylwd0lhxXoZlAq6CvSznecn4NQlOYCeWxqzMS3BugZs02qjd293KRO9DkDQnCaML
	zX9qbq9bf0qmBKqnOy5w6FQEKS8/46J+9rHBh9mL4XAByu3uB3R9FpwI2ZCuXRMkz3b1mEhiK7/
	sleJ+VJWIeI9iVhJOiBUoPxhLRj6FdSUVlU31sjf0FcHOiFOOYqe6rAgVBtGmbtfsTAq8cH6U5t
	qEwOrlHqZtgCGd8NmCiEy1SW+0r1MqfRB4AbRyxFHg24ysZvYA03Ru5UdW
X-Received: by 2002:a17:902:f541:b0:2c1:4228:3321 with SMTP id d9443c01a7336-2c69a2c4cd4mr979115ad.12.1781566435833;
        Mon, 15 Jun 2026 16:33:55 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac631sm112076765ad.44.2026.06.15.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:33:55 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:33:51 +0000
From: Lisa Wang <wyihan@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v13 03/22] KVM: selftests: Initialize the TDX VM
Message-ID: <ajCL34gnp2nDVM0K@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-3-6983ae4c3a4d@google.com>
 <a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com>

On Mon, Jun 08, 2026 at 01:57:24PM +0800, Binbin Wu wrote:
[...snip...]
> +	} tdx_cmd = { .c = {						\
> +		.id = (cmd),						\
> +		.flags = (u32)(_flags),				\
> > +		.data = (u64)(arg),				\
> 
> Nit:
> The two lines' backslashes are misaligned.
> 
> > +
> > +#define tdx_vm_ioctl(vm, cmd, flags, arg)				\
> > +({									\
> > +	int ret = __tdx_vm_ioctl(vm, cmd, flags, arg);			\
> 
> tdx_cmd.c.hw_error is u64 and it could be assigned to ret, which is a int,
> the upper bits could be truncated if the upper 32-bit is set.

Thanks. Will fix these in the next version.

Lisa

> > +									\
> > +	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd,	ret, vm);		\
> > +})
> > +
> > +void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
> > +
> >  #endif /* SELFTESTS_TDX_TDX_UTIL_H */[...]
