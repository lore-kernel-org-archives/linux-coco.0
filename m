Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A6E1FCFFC
	for <linux-coco@lists.linux.dev>; Tue, 16 Dec 2025 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844340; cv=none; b=Bpc6Ro5sVattdux3t8plW3vjPfMsq6xi/EqK0orLEBYWhjD4QfrbnHVkyzhyJPxilc+HWltdu0F0zb7gzxqzIoy1jCMxhb6GY06Y2EFXqaAWjKFkShkvmmyzwzx+7u/WUt4rj2ZzbQuYWFFYFFlnlqZSq+SgwTxBD4OPbbytqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844340; c=relaxed/simple;
	bh=xAEupN+yDQbfPOLx8WCP0Fm3k7XcdSjkfHRAm0nXpYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MJ8aQUrIpsp9ilIFMSY9JoZ2L+UE10TOUgM9aMQqahPTEBGijeTSAYx8NmF0S26cbKH9YPa7UrG7R8j5hvY1FwSh7blvL3JIBGIrtFzMfKrNNJUtkxxAvAThfs2nlKmXkV3kxouEoTxhXPqC/zxzw2Enkn60+61aY/oeIoLmCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d1Rbyv5g; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d1Rbyv5g"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29e6b269686so94684175ad.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Dec 2025 16:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765844338; x=1766449138; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2oerIBUWdoiR/iDg/DmDggDlh+UQ2iDCVQ3m0zhhek=;
        b=d1Rbyv5gRPyX0F0qMUOE4OLuC4ANU9kNC6vrqhoI49rCH+dwqH8epEaEA2JsfRyOmM
         87Uef6UlXc5cKqVJL9L6/0onT2EnzBDVQk7afoLNciCipdez0t6v35s2QN/6Lt0lbXia
         Hc5w+/VlIxFzpJOPhinVRJvb+MSPu9HmXq0tLYTX816wyPPka9gGtKssg8bf+gvO5pu2
         LmVkUYun2vuEGFeSWo1OpIovHIE8vJ3q+vbPYMeg+WH6s58aDrKaTWJQlTC2YUhxFG3U
         aFdKmX7VIu8oRLJn5RFqNFESpFqpeQRpZtnWdRT/lRB4heKFk76f7OZ+8GuVGhUz3Ptd
         ZkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765844338; x=1766449138;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x2oerIBUWdoiR/iDg/DmDggDlh+UQ2iDCVQ3m0zhhek=;
        b=nqY8XS8+wSNdnf8E0O5ikwiEFDV6ANtTL9Ch6+aJ7qy+AmSdPGx+pj3pNg/kFSDNQq
         n8fCekzMyNXXw3VyaHdHlpClPzfsmabQ1/jd0HxY/RfkNcDscqI1ZMxaIp+m2mriNoAj
         8BvrUgu2fNg3Ja/pTOrjTU95eOJf047qfU7PeSvIe4d53CiaBlYHa+paHLOiy7skZD9I
         l4Q8ZxKdVxH2vSp+2M+5LBo0ppPyU828KCfQALsC3Gy6oAPcxpYRootVbNIBjeK4yJ/O
         +zexsETlUMe49uiniLqUYVIlYIh9K1o+lVQM3NXxP/2puvtZy67v31lsL57Zf/2C6nJ1
         7WDw==
X-Forwarded-Encrypted: i=1; AJvYcCWJaNt/zeWJHhDRFzrN5jt/ic0nzdiwADZM8mW9A3teJ+0UOD/3/jaAVS5c8BrxNFhyQfSu7xPmUtTh@lists.linux.dev
X-Gm-Message-State: AOJu0YyFi35DkBTxQJ3lvwyIgkkA9iiAV+KijYENAcbT/NCI6amOGIsI
	4WsHM1dBATUWWBxuPieXLFbPZcpOP1948WGFpWj2k8rVxJiuRGS66oYLxKr0aOvG7kpEKh/y22j
	BOY4rkg==
X-Google-Smtp-Source: AGHT+IEWAD5o+jOHDqlEeD5qpWYrl9uWEbLiDfCND9UBUiVYMl3ijPuTAanLZR/4J50fvr/IM5bDgbUTjCY=
X-Received: from ploo12.prod.google.com ([2002:a17:902:e00c:b0:29f:b21:b1c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cecf:b0:2a0:8df5:2f6f
 with SMTP id d9443c01a7336-2a08df53433mr95353555ad.15.1765844337858; Mon, 15
 Dec 2025 16:18:57 -0800 (PST)
Date: Mon, 15 Dec 2025 16:18:56 -0800
In-Reply-To: <CAGtprH95s5wL1=rSSpG7Cmj5HhJOftwJY7CP27WE-qmq7hr+XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251215153411.3613928-1-michael.roth@amd.com>
 <20251215153411.3613928-2-michael.roth@amd.com> <CAGtprH95s5wL1=rSSpG7Cmj5HhJOftwJY7CP27WE-qmq7hr+XA@mail.gmail.com>
Message-ID: <aUClcGHzJK7PyutH@google.com>
Subject: Re: [PATCH v2 1/5] KVM: guest_memfd: Remove partial hugepage handling
 from kvm_gmem_populate()
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025, Vishal Annapurve wrote:
> On Mon, Dec 15, 2025 at 7:35=E2=80=AFAM Michael Roth <michael.roth@amd.co=
m> wrote:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index fdaea3422c30..9dafa44838fe 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -151,6 +151,15 @@ static struct folio *kvm_gmem_get_folio(struct ino=
de *inode, pgoff_t index)
> >                                          mapping_gfp_mask(inode->i_mapp=
ing), policy);
> >         mpol_cond_put(policy);
> >
> > +       /*
> > +        * External interfaces like kvm_gmem_get_pfn() support dealing
> > +        * with hugepages to a degree, but internally, guest_memfd curr=
ently
> > +        * assumes that all folios are order-0 and handling would need
> > +        * to be updated for anything otherwise (e.g. page-clearing
> > +        * operations).
> > +        */
> > +       WARN_ON_ONCE(folio_order(folio));
>=20
> I am not sure if this WARN_ON adds any value. i.e. The current code
> can't hit it.

The current code _shouldn't_ hit it.

> This note concerns future efforts to add hugepage support and could be
> omitted altogether from the current implementation.

IMO, this is a good use of WARN_ON_ONCE().  It documents guest_memfd's assu=
mptions
and/or limitations, which is extremely helpful to readers/contributors that=
 aren't
familiar with guest_memfd and/or its history of hugepage support.
