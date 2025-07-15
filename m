Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7692E2EF9
	for <linux-coco@lists.linux.dev>; Tue, 15 Jul 2025 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585624; cv=none; b=GcQbi/c5ZEj8+ca4n2w34+UniDpEhtBbbHGUocW7T0isZf8MSDyEa6yYmDHpil9r7BSg/dgQaOpP9re6P5pvrZ5asc45zTeQBuM2vlZxybvD0uv3brbvzNloQmCsSBAThnaYbEeutgfL1fc3StaNigGNGW4fYIoLI6T44FhFx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585624; c=relaxed/simple;
	bh=VR+8NUW3mL4ffGA48bjJUkuulhr2EyhWFt/DyW2IpGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Acx1S/j+0ZEJkNPAxKDKiWUJ2fNlYxa8GhDAcTq+JHp/vslgZItTeLAdC4jWi1I8dxp9R5x0bAe5sDDFT9Yt6+DA0SrZyLsWEE/Esb1uqyRUcELau4CYBb5hLCTrDVRcFHiB5yMRGOmTwcr+hIqO0+XqXwSdcVyA2rlxcnsbdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLvyxANo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLvyxANo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e389599fso203185ad.0
        for <linux-coco@lists.linux.dev>; Tue, 15 Jul 2025 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752585622; x=1753190422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlCJGXh+DOqyEfoBPhnw3kKyfxuvyf4oF8jquZF4T+0=;
        b=oLvyxANoWTwxB9OEayBup6jqsGr9BYWFt5UG6aeIg8YBqes+rQf8tS1xghRVsiFuZF
         QUPplfnSTWXqAl+Wrnt1Yrnb31sm9sNQtDA0MflEU3ElsHom81zDx9SuNnpwwMoU+ks9
         kP8Sxo3tcvcNPx3ExfO0Eirj4sUCapjUhCQSUL8N4scdtVfz2UNDt7B+xbdRnvYXU+DR
         CRX7CaNrWTHPVoIG8+gbHTvgx2FHgwY7aZ4sfLkm5sFRlUALYLaRFiorGQ9oCrS4gVmb
         ks302rHBKG1Y63vILT1NeL3NI9g1CxH/RLY5W9a6bUXIGWL8hKfO7WFPtOYF+nIoJvoZ
         l+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585622; x=1753190422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlCJGXh+DOqyEfoBPhnw3kKyfxuvyf4oF8jquZF4T+0=;
        b=mD2opiZYfW2gjRMH+VvGEP6hibB4PPynZIyReAx1158EYr0ATnAOSR20aKH0YmzYkB
         9DlLzX1cN3cpUKZSSSmI3DP8v4wApggTeomyNW3swPQn81udwZ1ZoUdBzXc4XWzJtvzv
         6L3gB+SFeYOcVXVn2UAIw/4pvmp3sH3Dg0kFvkKCTcLV2qRdgwCXHIVpPLR07IKPQANW
         eqjxHbjQA59D46soxoOb87p3GXN/sOg9Oa+95zoK7Icn2LZf69Ou7krye47E1/rENaHx
         NHcj/pFOwsFwmG+3ECXA5c0IHPg8BkcmvC0KqSDhuZW3yj2POljivpLjJJA4TBZfGZLp
         T2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVBh1Xaz69g7cIzUM11YETmg4XEpWRourVeI3HVnv5Nsk0g8+HE6td4nW/qxCkOQN3gbdhfYvEOoTM@lists.linux.dev
X-Gm-Message-State: AOJu0YxcW9tIqWlTmXuHIFaarZ8+IcOAwxz2thvh3iX0CQUedFviuYqJ
	oYRn3b51f0QPsBHAY+gDWQfR4NlKPXZywo+L2ZQgrukDDlSnQ3JeCEn+HB9jWYjmakoN+YyHXcL
	xy12AjQHdibjvzOoLSPYCptqFEKQPrFcuLWXpgX2h
X-Gm-Gg: ASbGncsd6mvh4Oa3T9OXX4Q2qiID/d4abGDq+amnB2nniA/dERUEkcny3byW+WTSyVQ
	CwziGLUFMNkpWq4V6uhGVCKxqKeyspSMfPdvCBzGzsrNaP2cym89X5G3cSMzxoMMK98WXixGR3M
	AVDd8tgw0Driw4O/MrOBTfADeSWHDJoFxBWP4f/XUeqmjKyBQP7cGyZgIuksEft6vf3ykfTD3f1
	QDmpD9fzKkCPsUEHHouGNhYU5IIxXE6K+IgnfI=
X-Google-Smtp-Source: AGHT+IFmDnj7+7K2+mnfOTNdR+Aw+YaytnwDDjpn3qAQ9yqrximLoYRf4l3rk/6s3TFG9z/SXMskhFKqUBehgiK3Wys=
X-Received: by 2002:a17:902:e84a:b0:234:c37:85a with SMTP id
 d9443c01a7336-23e1ab85c7amr2901485ad.24.1752585621695; Tue, 15 Jul 2025
 06:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613005400.3694904-1-michael.roth@amd.com> <20250613005400.3694904-4-michael.roth@amd.com>
In-Reply-To: <20250613005400.3694904-4-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 15 Jul 2025 06:20:09 -0700
X-Gm-Features: Ac12FXw0-WaLjY8qLo4gIdV3Uj1d2qvRKcayg-mqAaNlcSi7aOXIlvsa9VQBB5w
Message-ID: <CAGtprH9gtG0s9ZCRJXx_EkRzLnBcZdbjQcOYVP_g9PzKcbkVwA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 3/5] KVM: guest_memfd: Call arch invalidation hooks
 when converting to shared
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, tabba@google.com, 
	ackerleytng@google.com, ira.weiny@intel.com, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, joro@8bytes.org, 
	pratikrajesh.sampat@amd.com, liam.merwick@oracle.com, yan.y.zhao@intel.com, 
	aik@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 5:56=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> When guest_memfd is used for both shared/private memory, converting
> pages to shared may require kvm_arch_gmem_invalidate() to be issued to
> return the pages to an architecturally-defined "shared" state if the
> pages were previously allocated and transitioned to a private state via
> kvm_arch_gmem_prepare().
>
> Handle this by issuing the appropriate kvm_arch_gmem_invalidate() calls
> when converting ranges in the filemap to a shared state.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  virt/kvm/guest_memfd.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b77cdccd340e..f27e1f3962bb 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -203,6 +203,28 @@ static int kvm_gmem_shareability_apply(struct inode =
*inode,
>         struct maple_tree *mt;
>
>         mt =3D &kvm_gmem_private(inode)->shareability;
> +
> +       /*
> +        * If a folio has been allocated then it was possibly in a privat=
e
> +        * state prior to conversion. Ensure arch invalidations are issue=
d
> +        * to return the folio to a normal/shared state as defined by the
> +        * architecture before tracking it as shared in gmem.
> +        */
> +       if (m =3D=3D SHAREABILITY_ALL) {
> +               pgoff_t idx;
> +
> +               for (idx =3D work->start; idx < work->start + work->nr_pa=
ges; idx++) {

It is redundant to enter this loop for VM variants that don't need
this loop e.g. for pKVM/TDX. I think KVM can dictate a set of rules
(based on VM type) that guest_memfd will follow for memory management
when it's created, e.g. something like:
1) needs pfn invalidation
2) needs zeroing on shared faults
3) needs zeroing on allocation

> +                       struct folio *folio =3D filemap_lock_folio(inode-=
>i_mapping, idx);
> +
> +                       if (!IS_ERR(folio)) {
> +                               kvm_arch_gmem_invalidate(folio_pfn(folio)=
,
> +                                                        folio_pfn(folio)=
 + folio_nr_pages(folio));
> +                               folio_unlock(folio);
> +                               folio_put(folio);
> +                       }
> +               }
> +       }
> +
>         return kvm_gmem_shareability_store(mt, work->start, work->nr_page=
s, m);
>  }
>
> --
> 2.25.1
>
