Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50A385516
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259199; cv=none; b=RILHwZQbMN1ZGJnB7jN1dVF9wlQ706zmxucbCZ0qDPaHAfnEP3+LhKBn/d0Ebb9t3gs/zILGC0FGXM+n/YrsFDOlEadDL9iyYYFDyGQlc1abbgSsaq3lCp+PjWPb3J7YFOmtebVDI9rKo07qtf5H89dNHp+69tud4NYnlXOUnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259199; c=relaxed/simple;
	bh=SYo4jCZXOC1sdPoUWfjX57LqLt5CJFZ4L92+VvuTLX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pgvI4HcXj7ZaAo+wxGpT6grVC0soBP83bn6nYGffiKs0wCkbsEP+HwcfH/ZDvveJVpmvf7pqKer6JEhhcWttJcp+z2MRQ4XX1ztkE++iIqO8GhG3D3SKztNajwA/KwMLJjxS7wX20IIJB97Odf6/gVBROt/fZ7zBMF/j/E7PlpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MfRyHHNa; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MfRyHHNa"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so29419365ad.1
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 07:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790259197; x=1790863997; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXYyi9gz0ZpsLB2diBEdXlpJNNlCkIiClSl3fFTv2IQ=;
        b=MfRyHHNaFMhoLCc8P+uXLhWrp4s/zCCKMNSdGeAWAcrBDnw9uHhcFxGlDg7c40m2ZD
         2KtZaiF7EkZ8UJt3nm6ixN6U2FTT8e1ta3KuAutC2EIdHFiUNFVuK2IVSShkqSaeAV5p
         0ugt0OnCu+4tywoglPbdZLXAUY52PtpPPaPYIvysAQzgd0yuf8oCc5rXs2rfM/LIACoW
         qhg0SuuKaIXXZ1UP52aBvFFR2+CT8CQ4OAQfUYUUNoqqQQjkpJfHe3CIaKoy0jZu3pws
         guaPznCmvsbmNHeskAXuAU4IbbUDro68V/SwtXDEkSxVWwUc6Kkx1+MnTnA1gpX2vIC4
         1EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259197; x=1790863997;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXYyi9gz0ZpsLB2diBEdXlpJNNlCkIiClSl3fFTv2IQ=;
        b=U4CkUQF5sPCOygX6aF1h4CQcQj+lLmDD5WsbdLao7CTsf7/s+Y72Tqhd6wLs7HnQE9
         hhubkLZdtFqGCOl6GoA2iWomKa6DdQh0YT7TmpJ9RiWR6UoFWoZ19y7qaD3JWBjZSaNL
         4LostBPUVV6OLVXOkA495b4qUQI8RYIeHDDZ83kjXKiapvnPSuJfewVjAI9gPwbOu6g4
         W8/SJF5h/oJN2lSBFXR9kDW7XCgBnvciqV06OuDeYiPhofgoghI34u0qnmClIBlNv6ec
         qM6Ffkq01N1q6Pt9gJqmHNRDUmSFm7wpy/3e6otkLke6CSdr5Ih1FXbg4keg2s1KvmmN
         UIlA==
X-Forwarded-Encrypted: i=1; AKwUvBwRbZNtFsRMksH9XnnEhPjVP84olTK1JG7Bs8xlxnOD09VezSfgmQTA07LPaYltlYpv/1RHs1EF+Vq8@lists.linux.dev
X-Gm-Message-State: AFuF++n8md9efVfKOrPVZIIhTB54wYvraC/IoiF8YnyZ4qOXUhSoI1DU
	4as437XZwUXyLlQ8e+SgqAqazeTf0VKUF99I1X253g7Ik25gPlGorZi2VV4uSNyu69fjOD8Ztch
	vX7MgJA==
X-Received: from plar5.prod.google.com ([2002:a17:902:c7c5:b0:2df:55e9:4fe9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f791:b0:2dd:c100:942d
 with SMTP id d9443c01a7336-2df7e4431e1mr22247165ad.43.1790259196991; Thu, 24
 Sep 2026 07:13:16 -0700 (PDT)
Date: Thu, 24 Sep 2026 07:13:16 -0700
In-Reply-To: <50ccc54c-6cbb-4ae2-a84a-4dcbc958f91c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923163315.1580860-1-seanjc@google.com> <50ccc54c-6cbb-4ae2-a84a-4dcbc958f91c@intel.com>
Message-ID: <arUv_KydBD2kWkIo@google.com>
Subject: Re: [PATCH] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO
 on unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 24, 2026, Xiaoyao Li wrote:
> On 9/24/2026 12:33 AM, Sean Christopherson wrote:
> > Synthesize a triple fault, i.e. exit to userspace with KVM_EXIT_SHUTDOWN,
> > instead of returning -EIO from KVM_RUN if KVM encounters an EPT Violation
> > due to a guest access to a pending page.  Returning -EIO implies KVM is
> > buggy, and most VMMs will respond by completely terminating the VM, versus
> > rebooting the VM in response to KVM_EXIT_SHUTDOWN.  I.e. give the VMM the
> > option of trying to keep the VM (from the end user's perspective) alive.
> 
> But reboot isn't good, neither.
> 
> I still think a new specific exit reason[1] would be better, as I suggested before.
>
> [1] https://lore.kernel.org/kvm/1b0ea352-c645-461b-9e19-5202791f8e2d@intel.com

Doh, I completely forgot about that patch.  *sigh*

I actually thought KVM_EXIT_MEMORY_FAULT this time around, but I was worried that
it would confuse a VMM.  And practically speaking, the VMM can't do anything other
than print some diagnostic details and try to reboot the VM, because the guest has
very deliberately opted out of #VEs.

An alternative to KVM_EXIT_SHUTDOWN would be

  vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
  vcpu->run->system_event.type = KVM_SYSTEM_EVENT_TDX_FATAL;
  vcpu->run->system_event.ndata = 1;
  vcpu->run->system_event.data[0] = gpa;

So that the VMM could log the guilty GPA.  Though I'm not sure I like overloading
an explicit guest event.

As for KVM_EXIT_GUEST_ERROR, I don't see the point.  As above, the VMM can't do
anything other than reboot the VM.  I doubt Linux-as-a-guest will ever support an
interface that allows recovering from this situation, because again, the entire
point is treat unaccepted accesses as fatal conditions.

All in all, I think my vote is still for SHUTDOWN.
