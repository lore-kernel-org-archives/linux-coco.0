Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6703D179954
	for <linux-coco@lists.linux.dev>; Thu, 15 Aug 2024 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706713; cv=none; b=VpDM6A4Ed2wpzPKMFfHTWlRKUoVljqgxAeEfyLpHcDTbffMHIp1VdEnd9DLvF4LFvgoPnIXSg2QNeFlxw/fxZHGJEOQ5N+Ke6VrPSkO4bdKLGg9puwdBoDzwaH3jolhlVHzpswzg241grGnwlN8crU44Vui+7ckVyS1CYsG3uVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706713; c=relaxed/simple;
	bh=Ow1/2PM/XA+bt7tPUEZgVaKKbLuhy2wTsjK7gDnB3a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7iT/5BBQ4tOSH5thQydmN8foYYZCaFQEdANE+vrQiyHSlc+0KUi98q7sO/9YLSpEgPZ9WijfON9YV8aQ3pd86dtK5qERtRk3rb0ETv7JQS2v22qSBdh3oROAJwsVJUTOQPBkYhn/e1SyB8r44MSjMVbqG/kRSPCZoYk95raPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sh4YeOA8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sh4YeOA8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36d2a601c31so330310f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 15 Aug 2024 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723706710; x=1724311510; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fz7V9Tu3EtjBhPrJHgxXfRiSyngyRtnzUolHcCZqMic=;
        b=sh4YeOA810dACRpwJpDCGfWNWFLcbPvOyocaEnVsSpNkl+GDhi9vBLSTJ8jPDWSUHw
         l/odZk+wyIe04GMH+8YjfbiXzzhPfxenkzv9kDZ+mErwKMFpay4UGQarV7BJNHw9EnTe
         lgE0rLUdGC4cdvAIqCst3VQ6m3OrHhwn6WM9LSJjUGGHEh4PkKQt3LLI4Ljr22f/CHoF
         iJX/D4mR2qkgdf4NjN4sOQCJxtgLdGCAr0ahmBJbpkganHAds/wdBzzL8O++9yTQh9o7
         wzNNc9uY1nSxiMitkP+n8Gwe+bWsv8xW3pqTmhZ8HKb+QyTAHebWJeQ7pL9G4PLgYgxY
         4fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706710; x=1724311510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fz7V9Tu3EtjBhPrJHgxXfRiSyngyRtnzUolHcCZqMic=;
        b=Sc7J94X5fmKRfsV8EAHzgCE5XB2+MsJtdaz55qJgnShYHyqPT8kIFcGZg4c9bN4n82
         Dcn6+08pILil3NetSzx8SDtH2s6H99pcs2WDbTDxom9GEp6B66M/BTWtN24rLLjbw5tF
         j1pxBKchaYhXr4clblxyVSFvzzu0+pF6OvZuMu9kMwkm4ZiQvWBz7hJbu398tv0QpJ6i
         kCAFAxOLza4Wxc771IajjFw7tJy94OimlESQVrYNhlRlKB6tsmePECG1iAcyua42R1HD
         wF8RfqxUOpD1zM4HjlQp/jwRlvGBJJplds7l2T3kRdjfQGnVv2UPQjUoARti5asbj+Jt
         OS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUMc7ZbTNVg3wINPfIQ5XMLvQoDoqlhR1udao3rFt0ncV2fmO6TKsb5RUhZigyzlFfJfup+v92vuqR+PoB35xvdMqAHr1nuvQbBw==
X-Gm-Message-State: AOJu0YxqCVWoQllGFahjE1s0PXXzHI5s2Nt1xt5xs0Rnq9c3D1O1v5gv
	vIWq+ATzdFmT4R7tA11uMTf+KSlCtXfBDOkweICFX/5V+DnnlJuWJEWWivePwznwhoRhHekeikw
	t5TeROmMJhFpe1y4bVjz39RiLCBiu0C2ViHt/
X-Google-Smtp-Source: AGHT+IFDY+rlRX/qSGEGOl7eRG+hjtAxUiHzOwQTJK7cDbUC27G98FAuS1SlS95X/zfj/rFIWeJixLWpZK/CGw0VdqU=
X-Received: by 2002:a5d:660b:0:b0:36d:341d:6ba8 with SMTP id
 ffacd0b85a97d-37177821d90mr2579225f8f.63.1723706709402; Thu, 15 Aug 2024
 00:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com> <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
In-Reply-To: <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Aug 2024 08:24:32 +0100
Message-ID: <CA+EHjTxNNinn7EzV_o1X1d0kwhEwrbj_O7H8WgDtEy2CwURZFQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
To: David Hildenbrand <david@redhat.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Patrick Roy <roypat@amazon.co.uk>, qperret@google.com, 
	Ackerley Tng <ackerleytng@google.com>, linux-coco@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 6 Aug 2024 at 14:51, David Hildenbrand <david@redhat.com> wrote:
>
> >
> > -     if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> > +     if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
> >               r = guest_memfd_folio_private(folio);
> >               if (r)
> >                       goto out_err;
> > @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
> >   }
> >   EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
> >
> > +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> > +{
> > +     unsigned long gmem_flags = (unsigned long)file->private_data;
> > +     unsigned long i;
> > +     int r;
> > +
> > +     unmap_mapping_folio(folio);
> > +
> > +     /**
> > +      * We can't use the refcount. It might be elevated due to
> > +      * guest/vcpu trying to access same folio as another vcpu
> > +      * or because userspace is trying to access folio for same reason
>
> As discussed, that's insufficient. We really have to drive the refcount
> to 1 -- the single reference we expect.
>
> What is the exact problem you are running into here? Who can just grab a
> reference and maybe do nasty things with it?

I was wondering, why do we need to check the refcount? Isn't it enough
to check for page_mapped() || page_maybe_dma_pinned(), while holding
the folio lock?

Thanks!
/fuad

> --
> Cheers,
>
> David / dhildenb
>
