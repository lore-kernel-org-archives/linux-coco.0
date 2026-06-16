Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6E47D93C
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 17:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629622; cv=none; b=WcFirEUuffNqU5bliNp8nc9BY/vGY7axeU/KshAU7yL1TQpUB06H8tfw0XEepD7wqYJEyrAWZ/tTdRZDb74Oq8cnX4IaklUAhkAOEDAQJF/n1OeyLkxQh7CkwINMWjR40xUZfaBCU20GTPt355xvQPCY+FlCwjDA7i6mrzS9AQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629622; c=relaxed/simple;
	bh=7g+3VFOqzLTevM//CB6btZhXREAjis1zBYeItrSo5zk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OGCwtgx/RUsmshsjDjqk16jFK7jYpQD8OMRW4zPTB/T8Qn6spXBTP7u0WXCKjCHz0wVgMp6/0gSNnxV9KI/obaDnWhEanrNvmbDbPz/AZ6NqDxFI1qdey9uWmsYeXzDzu/LswkCXV2Z8Eg8Vl1CMMZLssaAwT/t6dQmRcA2LQgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMmjQPFM; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMmjQPFM"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8423f3e4728so3444912b3a.2
        for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 10:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781629620; x=1782234420; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuFT5oHokDW0bk02xVZpBpyZ66QlfdjnHGkLbhNe2ho=;
        b=oMmjQPFMGmHwBtAQ5563U/BhQj2w8Z7ScBtBBqLA8uDSVSdQtr0ii1qylFnONZiyL+
         Av4POM9UGnWCsb71PXzb5xPgcC8M8iIvzDUJaYhmFk9mZ8SbsQxxd2MukFHISZTU56Os
         oHiFEuQ4N+VEly2blagqKht07h0sxC2k8bbd9p/8qayKUgYeIdj0dBYfIsq2p8mj7fjx
         gjAcwUaOlVR0Ulc5PxLsmmSIqwwxZAq6QMiCtC1wWbfhjPV5WeeGq1pAi8VXcwVlOX6j
         +N3QEpKbPlIm53WEXa61OxKU+GCDOQnq3qlZsbQN4NPa9K+Mxr3Atm/hEiE0wJMCjvhs
         JvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629620; x=1782234420;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MuFT5oHokDW0bk02xVZpBpyZ66QlfdjnHGkLbhNe2ho=;
        b=FUJWJoeyJi6Q/j0LdzrmtTaAem75iRMo+kN5ac+lmrooIq8wo0rw0WAbE+4TnO6tmo
         +wsaGRvuDvC/AeM7Kll5+qbJ/5ccQ7MjzOUTaO8AyB1Z88GLcAEienrRxM1IpyNn++Gj
         jyt5K+dEm1CLUcH3kpV3GZdhChQN83zeh3F4zTBFT91WjWPNehtVrydGkO9zz1n05cHl
         zXnq7WochmVSjUSPdMHYqXOof4Q28i6z4r72zLSEhDZI++gC4VKmk0Hbs7ia+Cqx5gdI
         vGXvp4hxHHgu5Y5W5kvpsQjWzLyEix1mPcpyCVnZJkZ5HjVm5FCTkQJRl4d+EZGcQ3xI
         facg==
X-Forwarded-Encrypted: i=1; AFNElJ8uOyXliy4ivFaZP09zn/xT4ZPsBE9Jt96Hx2GlspdheefXBf8QVhaZFQImYssTCld56oku+/Amc+tC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6KnRR1dibEQ5RY+eM9w1N/F0DK2ajOmyHsyqa5S0XVkFlnlFg
	Ig5tPfobg5mmuejkYBOPIX9CnD3POXYYRSqoK1cguhj8cefcoqhatW3XB+xb6visnRN0DG4DLlS
	PNjC6bQ==
X-Received: from pfbfj40.prod.google.com ([2002:a05:6a00:3a28:b0:842:3d2d:1e84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600a:b0:841:dcb5:e6f2
 with SMTP id d2e1a72fcca58-84524561d40mr12669b3a.23.1781629619966; Tue, 16
 Jun 2026 10:06:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:06:59 -0700
In-Reply-To: <CAEvNRgFPKC2uOMaams7SS9B7LxvfU4h8DrPM5vXFb=pmXsgPbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
 <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
 <aiMOWkiVBqoQDAPd@google.com> <CAEvNRgF09SfDm=OgbrS8-wpfxbNecQkqAQwf1ELq1jWu7NjbUA@mail.gmail.com>
 <aiM2Nm9Eh68mIVX3@google.com> <CAEvNRgHjno=XDnMpTvZcNCR6D5RAi1rbynrL4CnnEa7Y-M3VLg@mail.gmail.com>
 <ajFfb9u6dU47Nj3v@google.com> <CAEvNRgFPKC2uOMaams7SS9B7LxvfU4h8DrPM5vXFb=pmXsgPbA@mail.gmail.com>
Message-ID: <ajGCs3W_zMyFmJjR@google.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 16, 2026, Ackerley Tng wrote:
> >> 1. What do you think of a kvm_arch_vm_finalize() that calls
> >>    vm_sev_launch() and tdx_vm_finalize()? My key issue is that
> >>    kvm_arch_vm_finalize_*vcpus*() seems to be for finalizing vCPUs
> >>    rather than the whole VM.
> >
> > Key word "seems".  I'm pretty sure Oliver picked kvm_arch_vm_finalize_vcpus() as
> > the name in commit 8911c7dbc607 ("KVM: arm64: selftests: Create a VGICv3 for
> > 'default' VMs") for the same reasons I think it's a good fit for coco VMs: like
> > finalizing TDX VMs, initializing the vGIC effectively finalizes vCPUs.
> >
> > We could rename it to kvm_arch_vm_finalize(), but that won't change the fact that
> > we'll need to decide between automagic vs. manual finalization, and it definitely
> > should be a separate discussion.
> >
> 
> This definitely should not block this series.
> 
> It's coming together for me now with your explanation:
> kvm_arch_vm_finalize_vcpus() actually means finalizing vCPUs! vGIC ==
> Virtual Generic Interrupt Controller, which has to be done after all the
> vCPUs are set up. Since the name is describing where in the VM
> creation/setup flow the hook is called (after creating VM and after
> creating vCPUs), maybe something like kvm_arch_vm_post_vcpu_create()?

No, because I would expect post_vcpu_create() to run after creating each vCPU,
not after creating all vCPUs.  E.g. see KVM's kvm_arch_vcpu_{pre,post}create().

> Renaming this to kvm_arch_vm_finalize() makes it sound like it is
> finalizing the VM, but this function shouldn't finalize the VM since for
> CoCo finalizing the VM also loads the guest image into the guest - deals
> with memory, not just vCPUs.
> 
> 8911c7dbc607 ("KVM: arm64: selftests: Create a VGICv3 for 'default'
> VMs") also includes a test_disable_default_vgic() function, we could
> also use something like that to skip CoCo VM finalization for some
> tests? Maybe that's a good middle ground.

That probably won't work well, and in practice it's just shuffling deck chairs
on the Titanic.  For vGIC, and pre-create hook works because the tests that opt
out of automatic vGIC instantiation want that behavior to apply to all VMs that
the test creates.  That's not the case for sev_smoke_test though, because some
testcases need deferred launch (test_sync_vmsa()), whereas others can use
automatic launch (test_sev()).

The other wrinkle is that SEV at least needs to provide the policy, which again
varies per VM within a single test.
