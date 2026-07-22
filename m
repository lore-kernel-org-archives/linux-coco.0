Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859573D3D11
	for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749264; cv=none; b=VfwvGcY4TOPcvW2WImYNrVLfSAgqwbwVA6zocbR+LGsNy3eMQObZahoAHMxZMfXnCqCReLQvgRvUHLa/TV9oPJE0+zOCYfzuNgmecFzSe9J6Vu0hUk61wHO4DiyLs4VIe+u6J1Btf3v1oY4bLcIa34mfLiWC+jZ6/Brkf8Jab7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749264; c=relaxed/simple;
	bh=7kTyB40oFlIluALDs9XAt2lFu1YN1LIdCiPCqvt/UgM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YeffBbCMxNpAjFXvJdn1zix54wBykOUGSkfB1VolFpH4SMtKLGjAY9PmwUSKD3dGxp3Gg0vw1GzMZQrDVxQoq8dyZpyZsBQvWuWIhqfZyT2fTSOBf0/Kl3tWMUl/dYPjz0RlNA7+af5vtFmmFDFG8Iqs2nOcyqI/WkmBsZTW770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t433iY7B; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t433iY7B"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so258090975ad.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Jul 2026 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784749262; x=1785354062; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWE97FUKUf3847vj+8EZyF89xO8S7BnbxlP1eCUHdrc=;
        b=t433iY7BfnagNfc1FW8e5ZC+g8peJCR5q5suWuThKpNcWmM1CBkNI+J99uUjOgkwr6
         mtO+BQwShQSU4ob0XjQo0mNZ2wM2cGvo3CLgiyGjT5+7wcPXlsF0bjPAbMt3Ut87BOnq
         NMbUSmDdwGAvqdaE0l9gqA7k5IBILnkXa/99rPQwUKCovpB5KNB37pvczWptQ1WnqY2g
         9bhaRSg/6yOGrfFiZejAD+7x2LzyCZssUyeYWqkYOdM+KrBOzWD1bxdr1AWBbPnhk8Ip
         gKROEJAuEFSWD+wUyasOk175AYa3GXQAJlB1DR4aUxB8/ejo5e2NIDy43O7S7StK0YW1
         rZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749262; x=1785354062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWE97FUKUf3847vj+8EZyF89xO8S7BnbxlP1eCUHdrc=;
        b=hvt4RWFWTr0oKvNEEIxGTdb4RKlInKUQ6zx5B6Bjy46i9ssMyBtkOi12ajOUTV628A
         AZG3rrWcRH778LcXyQvaicBAeN0nMT7GDvwNQuQtEpQRk6gMeXOMaq2nq8v5XktXSPsI
         gLiPVHZNao4n0Wr5t1YYKf0VoIJ8UNwujW7phTShU9K8KqPGbD830rQlDuejOcWRDl7y
         EypBOmn26r4+/WHCEzUpuzDD0Oyq8imT+5/ZEzuL6iq3AbgwZW4hNhdATOJHdwbljq5d
         mzCUi6i9YtL/6ZM6FG2zgV7YnnDMJkSBqN8lF3YIFiM3iV6PbIqpTZZIHNkIf5t+ju/L
         wWfw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9bUXrZNVkDQ0dskT5Vvmygx3Gop3dKu4HeZwluTddDVyqJwRpR1pQKQ/IvRvmWhrjhfAsEDtN0Oa5@lists.linux.dev
X-Gm-Message-State: AOJu0YyLP5ByKuJM+KlavnI+jasvjIvFgm6pWbuE8gGcLj0UDAKPsM/u
	+kYeJM5N+Y1p9lEyBheUfBeYetDud+JaNbPECcm1o87yZ5gtDxu/8hA4PK/+Keq7Ze4AS5ldGaM
	0x0WPsQ==
X-Received: from pla11.prod.google.com ([2002:a17:902:ffcb:b0:2cc:ed0e:f302])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec7:b0:2cc:7d4a:3f5a
 with SMTP id d9443c01a7336-2cfa71db768mr2550265ad.20.1784749261649; Wed, 22
 Jul 2026 12:41:01 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:41:01 -0700
In-Reply-To: <20260718014500.2231262-9-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com> <20260718014500.2231262-9-rick.p.edgecombe@intel.com>
Message-ID: <amEczd6t2ipEwjjf@google.com>
Subject: Re: [PATCH v7 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 17, 2026, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Add Dynamic PAMT support to KVM's S-EPT MMU by "getting" a PAMT page when
> adding guest memory (PAGE.ADD or PAGE.AUG), and "putting" the page when
> removing guest memory (PAGE.REMOVE).
> 
> To access the per-vCPU PAMT caches without plumbing @vcpu throughout the
> TDP MMU, begrudgingly use kvm_get_running_vcpu() to get the vCPU, and bug
> the VM if KVM attempts to set an S-EPT leaf without an active vCPU.  KVM
> only supports creating _new_ mappings in page (pre)fault paths, all of
> which require an active vCPU.
> 
> The PAMT memory holds metadata for TDX protected memory. With Dynamic
> PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX module
> with a few pages that cover 2MB of host physical memory.
> 
> Releases are balanced via tdx_pamt_put(): every control-page free goes
> through tdx_free_control_page(), and guest data pages are put directly on
> the successful tdh_mem_page_remove() path and in the
> tdx_mem_page_add/aug() error path.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> ---

With the nits fixed,

Acked-by: Sean Christopherson <seanjc@google.com>
