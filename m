Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2337DEAB
	for <linux-coco@lists.linux.dev>; Fri,  5 Jun 2026 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780682334; cv=none; b=Jd6XBd6OciFoePvlreDgRH+cwolvKssQmtoEZOeBti7nLwlY3KyotJvhtoR+/xlOdPghqas65JN05Evh01DtxjEu/mFBNuioJFV8x0Rl4HaGrYobja/1kj01D1YZTi0jvsEqrmy0Yt5Lx/XH0maQfCYKjiqSaxoMM7Hod7HuDn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780682334; c=relaxed/simple;
	bh=x86P0hCaA9P2MALnrduYKxx4y20a23f8MWvegFcyK1Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ser1xG4ZInHFfmeJADaoTFQ5xAezIIr+ZxXqFEu3iu58UsaRxDiZvNqvtsE/qKl/JpcM1cazNCNC6ej80sLtiAPdj2y2EBFVj+fXj9rK2jWqssvjrXOtskNwwPVOfnh+GlYQgYOaM5DSiaJ0whHLRE/wOOQiTZTr2eb29V6Zw3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7tTHMYA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7tTHMYA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c859d79c10eso2319817a12.0
        for <linux-coco@lists.linux.dev>; Fri, 05 Jun 2026 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780682331; x=1781287131; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb5QFbdIl+gNz2ph7qrt8I6eQo3B9HFVcNOaGdwtT/U=;
        b=d7tTHMYANFEBqeycSGH0TjF+6PNPbHdgJFK4jhzW/O5dSJltOUp9o3jstcPcMhEFFU
         1qYV7qzInjG6G3+EZqreljzEVF0jmlVzyVN8Kd3D/XQriIIN0RbDJ2ILR58tgkcs/Aev
         sbZb/g8p2HSKMztlxyzMB1+NNADTBQqXSyMfyjulQ6PLmIlRx8ZbcSya2gNXMjVArGat
         u1OlbAsO/5ZdBSWeWPqfZygAXJTvgvA7O7EdEPh2piwippcph6SNetSbVTU0PM/bl2T8
         0wQm9cUTQUr9hG+DIYtRIJOY+RZnIROLlRxDzC0qdAOQ97rGKwVUO0mF8d0XqEErXffF
         EF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780682331; x=1781287131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb5QFbdIl+gNz2ph7qrt8I6eQo3B9HFVcNOaGdwtT/U=;
        b=gQ5+erEtkWsFyMs6oJ1VZG041pNYbKAnhIy8BrlTW+4Nm0tX5BOaUpw/emYQv/8Aqy
         WvFAkG/aU/iPbcpJ5ccHBfdchrsPtFFO8SFmMZ6FxXsAV7ivHBFgGILH4umjoBNtm015
         tkAwTWopbI6ZWo0XAB2VxcjiD3Yz8ga8H1991dies6cgYIg+wUU1v/pVhxtyZeaK6sMM
         Dy6E8+S+2sPxbNv+drn8i8YqdIBQPc+MnUyWDUXFJkhqlzCd2lHrhr2UZmKhiUJLxtsS
         Nu5OFLufZBNLG4Funwo1y4vnqUSoLCN80oFsh8WxtRnpB1PGliF2O0X6xdPm7TuHxDBD
         CN8w==
X-Forwarded-Encrypted: i=1; AFNElJ9vqi7WXcmyfIOofjqZd/pvQb25en1yi/iqzgGbIx3gddGsQwPZ/4HDoAJei82BJ1WDQZ3z4R5TxV7F@lists.linux.dev
X-Gm-Message-State: AOJu0YzMrZS11Up0BOAZnfcYGWltxxVdQvM8qWg+NXGXwMQJ3n2vdr5A
	UCwVMS/Lv1ti5IyPGhxUqehBBxUdu2Of2EbT4rCSqa2cSKTqPO5jef2kVYwbI7Sj95+LWIS7JL1
	z8r0evA==
X-Received: from pggg6.prod.google.com ([2002:a63:2006:0:b0:c82:798f:628b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9089:b0:3b4:8b89:9fac
 with SMTP id adf61e73a8af0-3b4cd0109f6mr6075295637.23.1780682330882; Fri, 05
 Jun 2026 10:58:50 -0700 (PDT)
Date: Fri, 5 Jun 2026 10:58:50 -0700
In-Reply-To: <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com> <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
Message-ID: <aiMOWkiVBqoQDAPd@google.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
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
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 05, 2026, Ackerley Tng wrote:
> Lisa Wang <wyihan@google.com> writes:
> 
> > From: Sagi Shahar <sagis@google.com>
> >
> > Finalize TDX VM after creation to make it runnable.
> >
> > Signed-off-by: Sagi Shahar <sagis@google.com>
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Lisa Wang <wyihan@google.com>
> > ---
> >  tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> > index d84c629a1945..842cac168e99 100644
> > --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> > @@ -1479,6 +1479,12 @@ bool kvm_arch_has_default_irqchip(void)
> >  	return true;
> >  }
> >
> > +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
> > +{
> > +	if (is_tdx_vm(vm))
> > +		tdx_vm_finalize(vm);
> > +}
> > +
> 
> This doesn't necessarily block this series, we could (re)move this
> later: I'm not sure if kvm_arch_vm_finalize_vcpus() is the correct place
> to be finalizing the VM.
>
> Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
> instead?
> 
> The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
> __vm_create_with_vcpus().
> 
> While building this POC to test conversions [1] I only wanted to create
> the vm and vcpus and didn't want to finalize yet, since I still needed
> to do more mappings in the guest (and I needed the vm pointer to do
> mappings in the guest).

Hmm, I would argue this is a flaw in the selftests infrastructure.  IMO, as a
developer, it's quite surprising that the current value of a global variable
doesn't show up in the VM automagically.  I totally understand why selftests
work that way, but it's certainly odd and annoying.  If _that_ were solved, then
the kludginess of what you're doing goes away.

The other way this could be solved is by adding support for annotating globals
with a __shared flag, a la the kernel's __bss_decrypted, so that loading memory
into the VM can automatically mark the associated globals' pages as shared.

> Would calling tdx_vm_finalize() from within vcpu_run(), just once, be
> too magical?

Yes.

> It's also possible to have some kvm_vm_finalize() call that can be
> explicitly and manually invoked from selftests just for CoCo selftests.

Why bother?  It's obviously possible to all kvm_arch_vm_finalize_vcpus() directly.
