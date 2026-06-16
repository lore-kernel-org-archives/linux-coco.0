Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993C1FE47B
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 00:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569573; cv=pass; b=TsBNJCpacvhBSGoPvE/UL3msJomFlLXAzUSUluZSm44u81UvapDGyElxKUoLRBPTObLSHXutMOXmcq0GngUUshEyO5GucauvWBVTqfrr+lo/cvjNIbAWC2tM56hB6r+0pk2oXVEBkbwDN2UyBn9Ql93MQORnUqrptYU+ikQNfu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569573; c=relaxed/simple;
	bh=Koo/Jz4gLUExZ40dyzu72YS8cluJLIEkZVQM02WKK6Y=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ha1mTaFNzUyxhzjH3ITocBh+GMboZKx2UIYeopZ7WZ6ugrWlYNxx5J0qWzYRR4c48f44z36lXJtGhZMdXLv5OLqNbukitNngHjtrsdNm+L2hQyk1Ycd4OL+G7A26Dap5TV5I9KexUsYxseawfAU4jbzTipuynBfV0qzvdto9L2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wH48pBZj; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wH48pBZj"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-138501f8c04so1887639c88.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Jun 2026 17:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781569571; cv=none;
        d=google.com; s=arc-20240605;
        b=chVp0G/5k7FdscPTvFJjvpsFwnB3c6IprYmI/HiKPuFXwd6wlAwjX05iupwY9wovOt
         5locdsBTMmz5F2B/FesJOKnmeMMRjymeDvOf8UiWlGXWoAG7jJNKAMzpopK4twmwawx1
         VhdWKv2LnxlHSqodY2ArMd7SCHNCNh3HZKSbIgXW/Fho7YlOL0Da6o4DTzxD0CckCfm1
         8LVLi5tD4s78/4DPyHKJw8t09dj5+APKppPsZ/fUm4mQOw+BFj+2QNIBwr3VOnuydNXR
         GdedDxHMtpvsOra1B0klwuE2GNt4OeiLHMFpiNAsMX9/yC/61OHoQVHp13+j/dXKPJUP
         TVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=tE+C1LABhu/HpTkLPZGmRp5SO8S6COXMT4jaz0dQqLY=;
        fh=YRK+8hsYQiLHz0u6Or63MCKHCHwecKYgiSytw0GYfJA=;
        b=ik/yCzlGENsqygGT65C7N5i1JlR17YiecS/ScDm9HU3pIYyoWTqYDt4K2nBJ3uK6ge
         RaAmMQQmlstANeqx1n7k+4YbqOA6ul1J5LHHer+uOL4M7kNk5PrUO8TMjg2Cs0TiBeBA
         B3PPhD9pI3xd3l+06KOYD2/yLsZV2w/He6E3iyqmJoowDO9ny3OxxABw4VlzcYbPOeOC
         7xqJOR93YK4r+3cY0g/2xutHpJ4i6JUvDa2toSEZjHK3JsFDypIkaO0AmpLP6evErWul
         ghZfpJVyDIeMaRHWexSSuF548zw4BfHzUrTmx94gpzJeAPcMas2lvrF713kQBgjhTqqF
         lOmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781569571; x=1782174371; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tE+C1LABhu/HpTkLPZGmRp5SO8S6COXMT4jaz0dQqLY=;
        b=wH48pBZjZIOV34YWhmyw1z1+Ui8cyF3VBp2A+92m5MoHuRlOmcpF61TvpAIydVCHl1
         BsK5Rsq7tHbZ4Slitd9sWDSdGG2GymUf2XDGepuNkdy/MvAj7qrJukHHuib2vAIGdvY3
         4mF2DYj28tUyHe3gNVMO4fqkjo2ywsvpt5oF6P2uYyukBPTyqjx8Dww56hzOFOZ6WwNo
         2ja+ltaWoujUw2kCuhdFt2JfF53XKL87GVpKtqDye3YoqjyPFR5tMC8bxbAjL4/OWOEI
         IGQBM1cJvWkpqSi0Mz4LtbT1R9TyL+lbI7Lnt6hLTuCgmdkJRFJj9CUzEwry+Ey/lJcv
         TIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569571; x=1782174371;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE+C1LABhu/HpTkLPZGmRp5SO8S6COXMT4jaz0dQqLY=;
        b=PvLO8/q4G/eloDBHsNaaXcS3tR5HPQPPkZzfniUGgucp56k4Eehb5nqjbvBx4j+653
         gF8ue7lfPVXCGkAUxvBpSJK5DDYZ5IhohyOQT9JDh5u/vk/ZBCUQBQoes/M5zIdfT0Cd
         TIlulEg4akzqH6i+Yosb+mxLOR55sw5YFO3bnX1Esf+u/WgydHQJzERjhjGV9EplYlXh
         YCW37NX7HaudiUJwpOY4tE+SZU5ry756sDMKTSsGSbjLQs8PcbViNnSEe7vdPO+tOyzl
         8fqKIQPiU5lvUJpnmlwFCb7okHdrlWTTRlLaDClSP6vjU+feME2jT+oTCVtCKNfUEjKB
         xOPg==
X-Forwarded-Encrypted: i=1; AFNElJ8w1ToAYjKq3t1gIR71glK5+FGiCyXS+rWqMejjNv7e/QJDxf8Z9cUJUYYHrB4qMG83ICePhnctlOOs@lists.linux.dev
X-Gm-Message-State: AOJu0YyVbioAuw7BZcgqYMUZ8a52DILC9lfmkBkB5aqHTkWRCJI68gQW
	c4bid91wFg+imZLG9kP+ab3OhXmYnAFwS3+aj367JPslV+V5YLCK5pcDilAqZbsZ4zhupkLg91f
	F4e53GQzSlMPpN7Mv4FdvWQPdCH5znPzMeH+M1oEX
X-Gm-Gg: Acq92OHvdX2HJNWXIL0hcg3tty+3/m56GKSFpPwCT7IBCFmgoXBh7b87AV6yExeHA+K
	L3hwyCSjvsVBFTXlFVmCIoWCA0ZURhvcv7l5ksMQ817HEqiSLCzKCWRquGk+p2XQtSIJEC6bY37
	8WUIvIaUtUfo7Vk99fbs3vWWCbHl9JcDS3usLNDrp7kqpbrfeMxWP4oLnyPeEJ3RECFQv3e/IeR
	b7j/U242eY/qtyxNDpDpM05uHP7eCgymn5xmZirkGSsk+5isFYDrtBB2/WdU62ERCkBMUp2uoJ1
	mKeMC1fRLW7q2PnKwhrdlDWoPTRYJBKGK4phWj+w8LQIJf9hy/nECq8WZSn+uE3IADkd
X-Received: by 2002:a05:7022:baa:b0:138:407c:1d17 with SMTP id
 a92af1059eb24-1387901cbb8mr5193106c88.33.1781569569627; Mon, 15 Jun 2026
 17:26:09 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 17:26:08 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 17:26:08 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiM2Nm9Eh68mIVX3@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
 <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
 <aiMOWkiVBqoQDAPd@google.com> <CAEvNRgF09SfDm=OgbrS8-wpfxbNecQkqAQwf1ELq1jWu7NjbUA@mail.gmail.com>
 <aiM2Nm9Eh68mIVX3@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 17:26:08 -0700
X-Gm-Features: AVVi8Cc5zceSfwq1JSECSJwoz8IcfIBykP9G13fuyk-9uS8vJvNRi0GOVDWkEoY
Message-ID: <CAEvNRgHjno=XDnMpTvZcNCR6D5RAi1rbynrL4CnnEa7Y-M3VLg@mail.gmail.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Sean Christopherson <seanjc@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 05, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> >
>> > [...snip...]
>> >
>> >> Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
>> >> instead?
>> >>
>> >> The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
>> >> __vm_create_with_vcpus().
>> >>
>> >> While building this POC to test conversions [1] I only wanted to create
>> >> the vm and vcpus and didn't want to finalize yet, since I still needed
>> >> to do more mappings in the guest (and I needed the vm pointer to do
>> >> mappings in the guest).
>> >
>> > Hmm, I would argue this is a flaw in the selftests infrastructure.  IMO, as a
>> > developer, it's quite surprising that the current value of a global variable
>> > doesn't show up in the VM automagically.  I totally understand why selftests
>> > work that way, but it's certainly odd and annoying.  If _that_ were solved, then
>> > the kludginess of what you're doing goes away.
>> >
>> > The other way this could be solved is by adding support for annotating globals
>> > with a __shared flag, a la the kernel's __bss_decrypted, so that loading memory
>> > into the VM can automatically mark the associated globals' pages as shared.
>> >
>>
>> More generally, is your opinion that tests should not have to add extra
>> memslots?
>
> I don't care?  What I care about is making it as easy and intuitive as possible
> for people to write tests, and to minimize maintenance costs.
>
>> If I wanted a shared page, would I have to do
>>
>>   static __shared test_page[4096] = {0};
>>
>> and then rely on ELF loading to put that in the guest for me? Are there
>> some compiler flags/how will I require that test_page be page aligned?
>
> Compilere and linker shenanigans.
>
>> If I mark 10 globals as __shared, would the compiler automatically
>> consolidate the shared memory together?
>
> Yes, follow the __bss_decrypted breadcrumbs.
>
>   #define __bss_decrypted __section(".bss..decrypted")
>
>> I think it's a bit constraining to require that all guest memory be set
>> up statically. It's nice to have but I'd like another option...
>
> You do have options, they just require more work.
>
>> Many tests use vm_userspace_mem_region_add(), CoCo tests that require
>> finalizing shouldn't be disallowed that option.
>
> What does that have to do with finalizing the VM?
>

I could add more memslots after finalizing the VM, but then I'd have to
make the guest accept more memory. Hence, I'd rather set up all the
memslots and then finalize the VM.

sev_smoke_test currently has a separate vm_sev_launch(), which is the
equivalent of tdx_init_mem_region(), and that's called in the tests
themselves.

sev_smoke_test also uses vcpu_args_set() after creating the VM with
vm_create_shape_with_one_vcpu(). Would that work if vm_sev_launch() got
moved into kvm_arch_vm_finalize_vcpus()?

>> >> It's also possible to have some kvm_vm_finalize() call that can be
>> >> explicitly and manually invoked from selftests just for CoCo selftests.
>> >
>> > Why bother?  It's obviously possible to all kvm_arch_vm_finalize_vcpus() directly.
>>
>> Works for me to call directly. Do you mean kvm_arch_vm_finalize_vcpus()
>> is the right function where the TD is finalized?
>>
>> For tests that need to do more setup after creating a vm, is the only
>> way out to call __vm_create() then vm_vcpu_add() to avoid premature
>> finalization in __vm_create_with_vcpus() when
>> kvm_arch_vm_finalize_vcpus() is called?
>
> Depends on what you're doing.  Sometimes, the answer will be yes.  That's why
> there are "low level" APIs, so that some tests can do fancy things, while most
> tests can leave the details to the infrastructure.
>
> If there's a recurring problem, or we anticipate one, then we can and should
> figure out how to minimize the pain so that tests don't have to deal with the
> same boilerplate issues over and over.  Hence the __shared idea.

I still think kvm_arch_vm_finalize_vcpus() is an odd place to be
finalizing the VM.

I would prefer to not have to explicitly call some function like
kvm_arch_vm_finalize() (no vcpu in the name), but a common arch function
calling vm_sev_launch() and tdx_vm_finalize() is what I can think of
for test setup flexibility, without too much magic.

For now, I can't think of many uses of __shared. ucall shared memory is
allocated dynamically, and we can also make it shared cleanly within
ucall code.

The global variables (sync_global_to_guest()) will appear in the guest
as long as sync_global_to_guest() is called before
kvm_arch_vm_finalize(), which I think makes sense to people writing
tests for CoCo.


So 2 questions to push this along:

1. What do you think of a kvm_arch_vm_finalize() that calls
   vm_sev_launch() and tdx_vm_finalize()? My key issue is that
   kvm_arch_vm_finalize_*vcpus*() seems to be for finalizing vCPUs
   rather than the whole VM.

3. Would you like __shared implemented together with this series, as a
   prerequisite, or later?
