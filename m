Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A97EF19
	for <linux-coco@lists.linux.dev>; Thu,  8 Feb 2024 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707413451; cv=none; b=mdlAhBvFI3fqZTQpRZ5aO0zn9vpHKNHVTDYL2Wmdpirs3VqzpnTrfcpXmjlRi9WavlK5BXkvSIcVx66d4UeAhHMhk6Toks2VGtEhNsnImSRDEZFZRE3gT89M059EV4Wlwe/IwczXZc2uD/LMLcdCpyCmaRj3XGesBJWKfKqL9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707413451; c=relaxed/simple;
	bh=1IQJLk1ty4Cbv9srUf/jkoJhkkc0s4qbS6Kv1KMw1nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4ownSBW2A0MJFZqIJOrppkUXo2AQy9RgUNgRkV4zuKIMLaoxJbABAxjKLcJcBSP2E4TgYmf3efmEp/4FQ0MH8U0VaZCC1rvNuNcHdBG5659AdgocA7QxBlroTTr46OTFSALIz1kvj1xtptU1y9greKOuZIZCGs1vO65PJl/Mcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=df33/bQk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="df33/bQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707413448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sek37PEy2MZoPmgCe0RKHy1EATtqvffN4QHzb+4/dw=;
	b=df33/bQkQsoB0M0DAdEPIu1t0ocEjBnIyuOv3evmd8nZQ1P6jrVcqFdUU9D7ZpUnGPHqTI
	NVC2G9bF61GRw0ha/XXjxJFg6xVBVDn9M4qAeDpI2kyCxFMO9t7GwrRfOR60A/kO/sUc7Q
	DdXsiWh/y0s3NCvB/lQatSyI3kctM7c=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-rPuFFhxOP_GfHURUqAXn3A-1; Thu, 08 Feb 2024 12:30:47 -0500
X-MC-Unique: rPuFFhxOP_GfHURUqAXn3A-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7d2def1b9cdso1994241.3
        for <linux-coco@lists.linux.dev>; Thu, 08 Feb 2024 09:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707413447; x=1708018247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sek37PEy2MZoPmgCe0RKHy1EATtqvffN4QHzb+4/dw=;
        b=dI7u0Q+T6j2gnzWL84EF96c97zgOki2yNBW69tuxkdbcPATSspmP6DiUQYl93WpuHh
         knwVn3zv8e165carN5Q83mWoJ/TSu690F5pUabFU7nWWs3XqHZCj71Bd1Rrt7sHXZyT2
         cTho7h4qVyb/Vj8PcfDT5i4/sRMVSJfuMa90tB9RETp37I+5cH8DzivHPoZLynujswIx
         HbOC8PMWjQvGpaxE14e6XYUM5KIu9x4rxrWL+JKnN2NkmXet/+FxwIL5X4qe/BAp6ots
         ya1hVfx2ECk+1EEfbTtj3hMX/nJ3OFUBI9Z9n0N7US0dE7V+WsJJklVpSv35E7bqy2gz
         bN2g==
X-Forwarded-Encrypted: i=1; AJvYcCWphHglLQXocot3iL7II///treo/1NpNscvMDl4Lpdfit0CIpo7I5TCyL073bJRz+rvxYNz3cW80a6El/ce/Tp10WJIneaIPTCCOg==
X-Gm-Message-State: AOJu0YyALQXghOibu0iVJhbRHh/fM4vBHm3HgQ4YO/GxSAxekGa90NvT
	IfEWRNpJtz4uIuwlL/opjixQ0+pFSiqhQBDgyvCjZDeRVChDk5YCbiyH9PoMdWcG52D3P9ZwW4b
	ZDgUFej9LBcBAAq+fTYPMJJvR9UWGm5/v2S6s6yJXYc2yEdMK9KSnGudBrwSVjyuWQ+wA6U0rdx
	DARm+Gy4dbgA4yxkYIXvfD/msmMmsE+dWQ7w==
X-Received: by 2002:a05:6102:1158:b0:46d:5cb9:c3a0 with SMTP id j24-20020a056102115800b0046d5cb9c3a0mr2966169vsg.33.1707413445642;
        Thu, 08 Feb 2024 09:30:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHVJrEfvzHf07ew1SqpcL/nGkmHxsA0uPvjt9O5eXM69qEknptZPt4QM5pHUoRhFZH5bdOAnh06VotZpQb5AI=
X-Received: by 2002:a05:6102:1158:b0:46d:5cb9:c3a0 with SMTP id
 j24-20020a056102115800b0046d5cb9c3a0mr2966099vsg.33.1707413445212; Thu, 08
 Feb 2024 09:30:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016115028.996656-1-michael.roth@amd.com> <20231016115028.996656-9-michael.roth@amd.com>
 <ZbmenP05fo8hZU8N@google.com> <20240208002420.34mvemnzrwwsaesw@amd.com> <ZcUO5sFEAIH68JIA@google.com>
In-Reply-To: <ZcUO5sFEAIH68JIA@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 8 Feb 2024 18:30:31 +0100
Message-ID: <CABgObfa_KWVTk-yitCSU2aQi_a3vMTOMTHiT5s0qst5GtMwTzg@mail.gmail.com>
Subject: Re: [PATCH RFC gmem v1 8/8] KVM: x86: Determine shared/private faults
 based on vm_type
To: Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	isaku.yamahata@intel.com, ackerleytng@google.com, vbabka@suse.cz, 
	ashish.kalra@amd.com, nikunj.dadhania@amd.com, jroedel@suse.de, 
	pankaj.gupta@amd.com, thomas.lendacky@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 6:27=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> No.  KVM does not yet support SNP, so as far as KVM's ABI goes, there are=
 no
> existing guests.  Yes, I realize that I am burying my head in the sand to=
 some
> extent, but it is simply not sustainable for KVM to keep trying to pick u=
p the
> pieces of poorly defined hardware specs and broken guest firmware.

101% agreed. There are cases in which we have to and should bend
together backwards for guests (e.g. older Linux kernels), but not for
code that---according to current practices---is chosen by the host
admin.

(I am of the opinion that "bring your own firmware" is the only sane
way to handle attestation/measurement, but that's not how things are
done currently).

Paolo

> > > > +static bool kvm_mmu_fault_is_private(struct kvm *kvm, gpa_t gpa, u=
64 err)
> > > > +{
> > > > + bool private_fault =3D false;
> > > > +
> > > > + if (kvm_is_vm_type(kvm, KVM_X86_SNP_VM)) {
> > > > +         private_fault =3D !!(err & PFERR_GUEST_ENC_MASK);
> > > > + } else if (kvm_is_vm_type(kvm, KVM_X86_SW_PROTECTED_VM)) {
> > > > +         /*
> > > > +          * This handling is for gmem self-tests and guests that t=
reat
> > > > +          * userspace as the authority on whether a fault should b=
e
> > > > +          * private or not.
> > > > +          */
> > > > +         private_fault =3D kvm_mem_is_private(kvm, gpa >> PAGE_SHI=
FT);
> > > > + }
> > >
> > > This can be more simply:
> > >
> > >     if (kvm_is_vm_type(kvm, KVM_X86_SNP_VM))
> > >             return !!(err & PFERR_GUEST_ENC_MASK);
> > >
> > >     if (kvm_is_vm_type(kvm, KVM_X86_SW_PROTECTED_VM))
> > >             return kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);
> > >
> >
> > Yes, indeed. But TDX has taken a different approach for SW_PROTECTED_VM
> > case where they do this check in kvm_mmu_page_fault() and then synthesi=
ze
> > the PFERR_GUEST_ENC_MASK into error_code before calling
> > kvm_mmu_do_page_fault(). It's not in the v18 patchset AFAICT, but it's
> > in the tdx-upstream git branch that corresponds to it:
> >
> >   https://github.com/intel/tdx/commit/3717a903ef453aa7b62e7eb65f230566b=
7f158d4
> >
> > Would you prefer that SNP adopt the same approach?
>
> Ah, yes, 'twas my suggestion in the first place.  FWIW, I was just review=
ing the
> literal code here and wasn't paying much attention to the content.
>
> https://lore.kernel.org/all/f474282d701aca7af00e4f7171445abb5e734c6f.1689=
893403.git.isaku.yamahata@intel.com
>

