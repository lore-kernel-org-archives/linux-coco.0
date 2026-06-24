Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9628F3B52EE
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 23:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345016; cv=none; b=VZzUtUltH0OS093J5NRTfuSBRhxuuHLbP7wqhuuW3mMjg6V3wKFzKvVXf8Ep810nuC4yy+uCecXXLzmkKeB3HVKLnlgw/6VEGQwGDP15//zQA4H+OydQXSbfHs0xp9psoqXjVquPomq8RvnJ+id4aqz9yrJTPatwLAI1r8uYnTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345016; c=relaxed/simple;
	bh=jFwTgMVyvPSe2l2h8xYHy/RhaF5bRwpBGbC2LGmMwX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dn8pnYNIsTouMqspiCXayuUsJwMPDt1JmLYrezDcINm+VzUanyNa2YLNGmHL6RSZkj3+0J0S6n5kD6UUS+6KowK+jcXdnZBBnCuycpig71sEf9eBG9cFxyQa+FVIJ1o8Uvu8kx5gt1CR+f6cQf4feZgBR5WKrFTKUpgLugR6dws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPGA/lw3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPGA/lw3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6b7bd4e8dso21365ad.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 16:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782345015; x=1782949815; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=re80BiDMtfSQEgMKbr3zmDreG+eTyRX3VIJM0LJKtgI=;
        b=tPGA/lw3WdNFBbPlKd4lNIa3OnuV7g5tL9sIMHXLDoqeVZ7jECFMdUXMUReFwnJ5A/
         TsBqQHCJni8ToJgnhF1T2niMe32zBdV+JConVkYT03MZ2p03MfJJvYI1KLBRhJtOVnwp
         azniGXfJika4nGe/bm30GZfkS3CV6d02rdNUJLrPCZmgvQufhLWyNNQTPacqV7HxSr45
         k5BkurxzJikD499C+Bo+XEzMUuunlD3h9rbPF0jUmBAwk2D1jFAtw6AUKsXaK+TbIyIX
         mA/Vdj6Xw7FL5yqfbjuqMASnixdF9K5kphrVuWgg7iZ5oc9AiLoQy62NaspBbb66YQkB
         Zhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782345015; x=1782949815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=re80BiDMtfSQEgMKbr3zmDreG+eTyRX3VIJM0LJKtgI=;
        b=QNogEPNBkOQBPncd6dfZ2ILeSYwHnYa3nFPBNI+NHIyOSbk7Tm+XzwvTu6qNXqz19R
         /KFOM/uvh7K9gqP24TaaSDO18GxsoAkkMNMk4qZ37gvHVRmWTBFI9p6zz+zTfEiBsuVI
         61G9fgrFOe3znwncCDFR2e0UxKESZmirMXW5x1WfZMNIHVlTeXiGmoQ/RjTxGgQ6xcEl
         AfexFRIGSPGx6zVeiKZgqw9R6s2lNIYOp6uUfWWim8c6M2d64NBBa25EFqtzT8kowiNH
         RtXp9Nm6tb/E8dMklES/bmmRp0l2RXoHkD7x+r3NUIZKolzDI7LCNuqRAvzoibtguDgt
         PKrA==
X-Forwarded-Encrypted: i=1; AHgh+RpjOOTv9HSmIj56taCVURltm44AfhaDoGLG+RCeozJcUO3jf4W8o8F5/vTFtl/l8YDF1UWOBu5Dt46w@lists.linux.dev
X-Gm-Message-State: AOJu0YzRIh+yBpNhrSpy85H2VaSNUzFqigTTL4wQx5kXeHM/gF0JxsOR
	XXZu69UVjeNAduvv/uN/04tz9/4vD3QUIMV3FVh5v0CMoGuyb01PH7AjVGB2OBD4aw==
X-Gm-Gg: AfdE7cnXz+C1Y/iVEP14U1LdAw3Eum1XYl3T7XMTxgceQM/66kotogHusSApFyjVtmB
	3ODENsLrA7nT0Cmq2iqHY0nIFt3Doks9XRcCkboIo+Z5UcQvg5SX0nFVf3XMzcyllFK+vjzoD/6
	zBmGwnIVavFEY4MtC/aqRNjz6S3te95jWDQTvUp1GduWdoCU1qTTbago5wFkfqIoy/DEv/1/y68
	EAlcKEXsQhydeHNI1lL3Ytxj985UU166h/UwQAM4rDETSZlNreQOFNVV9Z70nuAuPHgYJNSXK0Z
	eLgl8erguz/sMTlWGU1hPutnj7pg1MJbWobGq03jBPBOmpm5lKBfuNwVmD0qFRvAlGHmALYCCGG
	U5DuKVnzXYFk6oAt7iS2O8ruto1saCcT1UimbmBA3ugBFmHBko3dAl9J/9mlHl+9k3jg0/XHYbN
	TvysVScCca2Zc1MBH4LOZKGc6feb+mZbiH5Hnc4/60vmY=
X-Received: by 2002:a17:902:f687:b0:2bf:193b:a195 with SMTP id d9443c01a7336-2c7fae6b840mr507585ad.11.1782345014009;
        Wed, 24 Jun 2026 16:50:14 -0700 (PDT)
Received: from google.com (74.67.83.34.bc.googleusercontent.com. [34.83.67.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1df037sm546294a12.17.2026.06.24.16.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 16:50:13 -0700 (PDT)
Date: Wed, 24 Jun 2026 23:50:09 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
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
Message-ID: <ajxtMdOFCPiMU0Pw@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-3-6983ae4c3a4d@google.com>
 <d27cce6a-da0b-46dc-96b3-5f2f699907eb@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d27cce6a-da0b-46dc-96b3-5f2f699907eb@intel.com>

On Wed, Jun 17, 2026 at 11:21:49AM +0800, Xiaoyao Li wrote:
> > +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > @@ -11,4 +11,34 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
> >   	return vm->type == KVM_X86_TDX_VM;
> >   }

Thanks for the review. I will change all comments for this patch I did
not reply here in the next version.

> > +/*
> > + * TDX ioctls
> > + * Use underscores to avoid collisions with struct member names.
> > + */
> > +#define __tdx_vm_ioctl(vm, cmd, _flags, arg)				\
> > +({									\
> > +	int r;								\
> > +									\
> > +	union {								\
> > +		struct kvm_tdx_cmd c;					\
> > +		unsigned long raw;					\
> > +	} tdx_cmd = { .c = {						\
> > +		.id = (cmd),						\
> > +		.flags = (u32)(_flags),				\
> > +		.data = (u64)(arg),				\
> > +	} };								\
> > +									\
> > +	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> > +	r ?: tdx_cmd.c.hw_error;					\
> > +})
> 
> It looks __tdx_vm_ioctl() can be implemented as the static inline function.
> 
> Given all the existing xxx_ioctl() are implmeneted as MACRO, I'm OK with it.

Most vm_ioctl() and vcpu_ioctl() used MACRO.
I prefer to use MACRO for `tdx_vm_ioctl()` for the `#cmd`, but I am ok
to change `__tdx_vm_ioctl()` to static inline function.
If we can only change part of it, do you think it is better to change it
as the static inline fucntion ?

> > +}
> > +
> > +static struct kvm_cpuid_entry2 *tdx_find_cpuid_config(struct kvm_tdx_capabilities *cap,
> > +						      u32 leaf, u32 sub_leaf)
> > +{
> > +	struct kvm_cpuid_entry2 *config;
> > +	u32 i;
> > +
> > +	for (i = 0; i < cap->cpuid.nent; i++) {
> > +		config = &cap->cpuid.entries[i];
> > +
> > +		if (config->function == leaf && config->index == sub_leaf)
> > +			return config;
> > +	}
> > +
> > +	return NULL;
> > +}
> 
> No need to introduce a new fucntin. We can use get_cpuid_entry().

I think we cannot use `get_cpuid_entry()` directly here.
This function is called by `tdx_filter_cpuid()` to check if KVM's
supported CPUID entries are present in the TDX capabilities list. Since
the TDX list only contains a subset of CPUID leaves, some queries will
naturally return NULL (which we want to gracefully filter out) However,
`get_cpuid_entry()` has an embedded TEST_FAIL(), which would abort for
any missing leaf.
How about I add a `__get_cpuid_entry()` to share the same part of them?

Lisa
