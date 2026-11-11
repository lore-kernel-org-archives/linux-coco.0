Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413446;
	b=eLDH90syX4iidjvF9qSnu+njUVds90HojYS1iZZg7lj6tOodlAST9U10g5tpwehkwWZR
	 atcUAI83pO39mjP5prCujwFIR6VIpIT8SJUh8022atIY6Sw5tQV1h72C25d6PEVzS+ymP
	 WHWMXGaPlBPzDrNQd5evEf4qA+vAjJJigMPevxXaWr59wO6eYSeAYQpmoTEQ6s3RUUHdp
	 bqzbEplriG6yWNhx9cP7nguUl3p5pXv4N+8OPTzvRYe1Uo1zwLTxngYaEoMoHk9ubL3Dr
	 YSEM2teolZTBvYevdwGYB9GUWK94bGxd/npRsUzWsrl3fK4Ds3uyGXWLUk9Zia8fjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
	b=oQGvhLflK11vkVCYtvSFsBadiYU5/HdIpueK5WgCnFzBn+12jt/IEPovrStkCTS8qhVj
	 CjgDQx0QQWj7g0GOYHgPKMucXAgybYLkhc6+rxsam3JIkPDytFcPGGzHMm7yGpHFo4oOs
	 gfm3AYl4z+c34mCieG8oN86umRMtj3Gs7rRxE3XJ/tP5Rh7z/YVgUSGArnfKUv4Wdu3LR
	 Kfqf2aud6bHa/dg01ieftDcxAw9kzyOHGL36oRe4dVGWVGHm0FrnNSCOE6HBIZUQBqYCv
	 xPdJOyCsfml3E2LHRAiQ7yDf6rGnUIatyNTn2tCGn90ntwZBTYUt5zgRjS8rZdiLLRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YoZafIF2;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C157606A331
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 16:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C157606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YoZafIF2
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so3921020a91.0
        for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 08:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794413446; x=1795018246; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
        b=YoZafIF2pQpoWwSMC3jQCZfrYW/Ctic7owYy3TNGllxZlwgxbvGPPXeQJymO+/iX+J
         NBzN8cLmAkWd6+0Pg5ZhzPhEER+BBtLlMY/YrbmleQRQfBpKWh30yD54WwzeAlJIgevD
         NitIMWFfveUnSlpg+XN+AbuLmwOT7P7ogKbpQXIOuGL1gpli2mRDlkBvTY83LIyGMiEb
         wPT5Y91cj2eV7F+qBnXnqxsZCgVeEmkYgWKhHg3+lKO+YeuTkQ2cr1XqzrQG3tuImW8V
         NUW+UJAgx5iB9pWAHbWWyumR76jWM1+M8S5Qs5zQInOes3t2vCnHrO6yp+3tlmvx5dpT
         uf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413446; x=1795018246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
        b=oXq0Bal4M3m0rTxB7pxIUaQTqVedjnP836T8Lt0QzK1QfuFhhT+05DCwtZrNkZ/2KC
         rffWLxb0OcT7XISMcyHmsBBUVrVIerCLGMym0H7Q4UJZ2iIuqdDLrhY5xy7zb/8SmIYA
         qmUt0w2h0UHiy9EtyZZUndEyGompJfnbii4qhGVs16kmpxnZijMBtKO36T9SFBkKYh4z
         SeZKq4LftBDYrWfNUqA7W26HnLsRBly7PKyepcXC0PfyaD9E7xk1xNHpbxCZcUgXxiTB
         aw3GUYy95lyecyzRtmDkUaY/dh+JYGsYMaF6J0g1Ux9MGgJNfpdkSoB+LEfJQQ3n84Eg
         7T/A==
X-Forwarded-Encrypted: i=1; AL+hErE5Cqc2IpGUR3pBkb8xSRE4CYzG0sk+q5WM5wrAgvLPP2+vsWxNpwR1xNo8wxcjqw/OUqYFEySeX6Oi@lists.linux.dev
X-Gm-Message-State: APuU4Z+g9vXNvtLgxhCeL1/M/j1GkJh4l/pVbyRWAk/M8y4LZMAKx1yM
	wdrzG0M0pWc41mMXbikB3SCQymiODznxd7049L2Bdt44k1Q9MMxNN/qhcJDot5H78eR/VbOMRow
	Qho2yyg==
X-Received: from pjbkn15.prod.google.com ([2002:a17:90b:480f:b0:3ae:b67:263])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f86:b0:39e:6c68:c77a
 with SMTP id 98e67ed59e1d1-3b182f2699emr2883420a91.48.1794413445538; Wed, 11
 Nov 2026 08:10:45 -0800 (PST)
Date: Wed, 11 Nov 2026 08:10:44 -0800
In-Reply-To: <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com> <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
Message-ID: <avSThO-PZPrIfT5g@seanjc-mac.roam.internal>
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <iweiny@kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 11, 2026, Xiaoyao Li wrote:
> On 11/6/2026 7:46 AM, Lisa Wang wrote:
> > diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > index 4330290d29e9..9d951f67b3b5 100644
> > --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > @@ -46,9 +46,31 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
> >  		    #cmd, ret, errno, strerror(errno), hw_error);	\
> >  })
> >  
> > +#define __tdx_vcpu_ioctl(vcpu, cmd, _flags, arg)			\
> > +({									\
> > +	union {								\
> > +		struct kvm_tdx_cmd c;					\
> > +		unsigned long raw;					\
> > +	} tdx_cmd = { .c = {						\
> > +		.id = (cmd),						\
> > +		.flags = (u32)(_flags),					\
> > +		.data = (u64)(arg),					\
> > +	} };								\
> > +									\
> > +	__vcpu_ioctl(vcpu, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> > +})
> > +
> > +#define tdx_vcpu_ioctl(vcpu, cmd, flags, arg)				\
> > +({									\
> > +	int ret = __tdx_vcpu_ioctl(vcpu, cmd, flags, arg);		\
> > +									\
> > +	TEST_ASSERT(!ret, "%s failed, rc: %i errno: %i (%s)",		\
> 
> Nit: tdx_vm_ioctl() uses %d for ret, while it uses %i for ret. It's better to
> make them consitent.

Ugh, KVM is anything but consistent.  I didn't even realize half the macros use
%i instead of %d.

I chose to "fix" tdx_vm_ioctl() purely because it has the completely unnecessary
PRIx64:

	TEST_ASSERT(!ret,						\
		    "%s failed, rc: %i errno: %i (%s) hw_error: 0x%lx",	\
		    #cmd, ret, errno, strerror(errno), hw_error);	\
