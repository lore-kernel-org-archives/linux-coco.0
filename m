Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9E84A3B
	for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715638105; cv=none; b=QKpbrI7cPiPkS5rk4mrfK2cDFrAd8dxm4PSd+P22skxrNgr9rTqRt0Q5NRu/EkHVndf0S7yr/6ZlAaGG0LXsaXyiYW314fHRZ1B82tXNoU7DrhMlqJuxFSq2wwMRrofzaLWsKq9HUmGyY/Km+GK+Bt8XHP7uUc15sBuX0SGnqWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715638105; c=relaxed/simple;
	bh=dEkg9sqCSTUh6OfERlj2DZRvvgB1ehgJLUUyf9z5i3I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=neNRTfxa4UQ8QCcxkPQAksyTToL8eAnI9BkZqomeSdmhzax9aBeg1WUbJUV2crkO/1mO18lHUAnW5MrLMwHdjn8slKr46Zd27wtZct4o3djOFo5l7OvB9Cmwgr7W4OIltUVYiKWGvaYo+vRBTws4JiGqbPDKU5U84uYNuaWEEpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YK5C5X92; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YK5C5X92"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6f474d5a8dfso3518966b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 15:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715638103; x=1716242903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+ImMk5mMg/Ph6+UMWEFe1i6y50T+E5sNxxEArfpRbc=;
        b=YK5C5X92xSaZml7TyD4BA/lQKg4VezbllhZtFVIWWIt6IUTjOe8YguaYrxZ8V7NXA6
         24hP6hmQnOsPP2pA1KXeFobKScLpxquAGV6xxH9AdHEJO3PWtGLxYQOL2nthwVk7m3Jj
         5ZeBFv3oZboiBjaLG5bvV1QbP+T5uwYSOdfy+69rn9eJjQZO7QFCtLC/3hxsgzfUfk/E
         YaPF8lvsJpZ5concqVW9V6Q8mXK4y3DTmjokymuFMVXxQvIV4i24TSeK9jBoymlU7j4O
         5QKrL7XtIILOmTvuMog3DOsiOsPvKT7esko2L/k8FM/egDgxIRWqeY+MjBKnkkxDlZIF
         4+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715638103; x=1716242903;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q+ImMk5mMg/Ph6+UMWEFe1i6y50T+E5sNxxEArfpRbc=;
        b=qPqV3q2S2EZRxByzJZHRk+a106Q1EuDNAxaQhnjr6aSEaOB1HxMCHPB5AlYwgBJqWL
         KJXFNx2UGy3O0hEQyaFYou8TaRVQXV0HRcqCZSqwdNCR/3mPtZf3oBT6jop4wnTahWqS
         ebDJ3ZtlkEi73KA86vnUpN6IFlFGU1zrb+i+pI4nHKUDgRuMNTxMzxvM/YrrDXcK/qGx
         tMwdnZ76uHJkHML/0ir3wJCuA4dp0vBhukUTUSyWYi+f7w5iDjM88F9S66sOYUc9Wxto
         LYcBGvfkD5cuhMIvwtpBOSRAtNg0C5fCeeffmyioBWu7SiBlOTl4mOvBSki8gyri4kKs
         SHqg==
X-Forwarded-Encrypted: i=1; AJvYcCUg86CfAc8qXaRvtPVoz+rVFDv2eAi358gKw6/mzIhGWPLcmznW5/ZYTLYxe9ZiiTJcXCEZyRjLlwwa1L+g3cejA/pabf/ARDpEVg==
X-Gm-Message-State: AOJu0Yx3TAixceyzPa5w8g73ZV88g5ItfGRcjfSXD6KTYpbFJAA/ZxM2
	j5AtAtiWDz0rxIgOJibyLhOfxtyxjIKucUwvR4JpNdU8f0RZIWxc4YyF2TfEgpS3SmFmoa2wCga
	Q2g==
X-Google-Smtp-Source: AGHT+IG/zTzeKngjsr80XFMiQVLcYBKJaamxbE5SgnpVzmy6rN4iBqZOwzyNNwZSjtZ3zMA04MvOdqL+ZuY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:a17:b0:6ec:ceb4:d9e2 with SMTP id
 d2e1a72fcca58-6f4e01b9126mr999510b3a.0.1715638102944; Mon, 13 May 2024
 15:08:22 -0700 (PDT)
Date: Mon, 13 May 2024 15:08:21 -0700
In-Reply-To: <CABgObfZ=FcDdX=2kT-JZTq=5aYeEAkRQaS4A8Wew44ytQPCS7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240510211024.556136-1-michael.roth@amd.com> <CABgObfZxeqfNB4tETpH4PqPTnTi0C4pGmCST73a5cTdRWLO9Yw@mail.gmail.com>
 <CABgObfZ=FcDdX=2kT-JZTq=5aYeEAkRQaS4A8Wew44ytQPCS7Q@mail.gmail.com>
Message-ID: <ZkKPVT8Xpp4lh6Xa@google.com>
Subject: Re: [PULL 00/19] KVM: Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, jroedel@suse.de, thomas.lendacky@amd.com, 
	vkuznets@redhat.com, pgonda@google.com, rientjes@google.com, tobin@ibm.com, 
	bp@alien8.de, vbabka@suse.cz, alpergun@google.com, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	papaluri@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024, Paolo Bonzini wrote:
> On Sun, May 12, 2024 at 9:14=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.co=
m> wrote:
> >
> > On Fri, May 10, 2024 at 11:17=E2=80=AFPM Michael Roth <michael.roth@amd=
.com> wrote:
> > >
> > > Hi Paolo,
> > >
> > > This pull request contains v15 of the KVM SNP support patchset[1] alo=
ng
> > > with fixes and feedback from you and Sean regarding PSC request proce=
ssing,
> > > fast_page_fault() handling for SNP/TDX, and avoiding uncessary
> > > PSMASH/zapping for KVM_EXIT_MEMORY_FAULT events. It's also been rebas=
ed
> > > on top of kvm/queue (commit 1451476151e0), and re-tested with/without
> > > 2MB gmem pages enabled.
> >
> > Pulled into kvm-coco-queue, thanks (and sorry for the sev_complete_psc
> > mess up - it seemed too good to be true that the PSC changes were all
> > fine...).
>=20
> ... and there was a missing signoff in "KVM: SVM: Add module parameter
> to enable SEV-SNP" so I ended up not using the pull request. But it
> was still good to have it because it made it simpler to double check
> what you tested vs. what I applied.
>=20
> Also I have already received the full set of pull requests for
> submaintainers, so I put it in kvm/next.  It's not impossible that it
> ends up in the 6.10 merge window, so I might as well give it a week or
> two in linux-next.

I certainly don't object to getting coverage in linux-next, but unless we h=
ave a
very good reason to push for 6.10, which doesn't seem to be the case, my st=
rong
preference is to wait until 6.11 for the official merge.  I haven't had a c=
hance
to look at v15, and at a quick glance, the SNP_EXTENDED_GUEST_REQUEST suppo=
rt in
particular still looks kludgy.  In general, this all feels very rushed.
