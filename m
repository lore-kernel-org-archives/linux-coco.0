Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE22032A
	for <linux-coco@lists.linux.dev>; Fri, 10 Nov 2023 22:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tBm6M1UR"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5b3715f3b41so36292337b3.2
        for <linux-coco@lists.linux.dev>; Fri, 10 Nov 2023 14:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699656476; x=1700261276; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDGYhhOiBni+WGtNPfLYpO88NsOvPheEqc/xC92J1aQ=;
        b=tBm6M1URcHtoYGVgL8y1O5yJalYB0vbAiK8GqNIwKPDpux3jvJCyC7MxZ0yUdGuaIG
         gBINTrvB7iUelB/MiHtAxLC+8/Shj2ycWJu65xwMLfJiDc4/QJj4RQHX5+9XndKKWwhi
         d/k4by578/Dqix8qOtBlxObAPYtfp9LtatbhemspNybYeEIPSNKpP6CipzKRvfPGLv1t
         wJOxNBmi9sGsCdsn9TzuV/CbyIBv9YB8xKB5IKYzx0m/Am97Gw8C+pgRABrQPBG++Euo
         W04/eaygpJGjaRNOdEkbja7m+kzAKfIpqwsQ9zIHZz/pQJNocDEThDhciJOFhmZstWRD
         ETUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699656476; x=1700261276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDGYhhOiBni+WGtNPfLYpO88NsOvPheEqc/xC92J1aQ=;
        b=iBAdmFiQ3DDdS8ysLJy2vLtD1/fVKzuQ2i9t0UJuVoalzV4VZHp4F++O3IgRh2Pjeg
         PBU9Ikjikz73GH/iR8MhkBzU60r6wx/4yNz7ohQj54QMCMX5jYNppYukiXStkggp17S+
         ENDsQ7RNO3lucL4DGZDQcZ8LFiro2H1K+njpdaR3r3bX2sFB2neAyX/5FTx0+l4GAD3Q
         pDB06PfvLfW+oZhey1YW5gypvDYe8zU++Ryk0vsw+we5C3ZrLo/fk4ChZm+Pq8xR7g1l
         87Ufboo+eQptfBAuRw8Sv0LxzLM96vHf91QEjI3g1eFSyC89ytgeovHpqqLaxqe1VlsX
         UFjQ==
X-Gm-Message-State: AOJu0Yx3ohnAeYrBVosg8ME9Ai24YPD4eTDr5NGQign5JZZJI3m3YD0U
	ie2dl6ng+ynqWSMwr0XaiDNmG3TqIGQ=
X-Google-Smtp-Source: AGHT+IGuCejQ9nzI6qVXkD9n/wUtUbU2Z8Vq+rLz0v+Hp4KUZKh+APKUTptATg9yX5HKoQF7ptWDVbyT1fU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:6d4d:0:b0:576:af04:3495 with SMTP id
 i74-20020a816d4d000000b00576af043495mr17658ywc.9.1699656475780; Fri, 10 Nov
 2023 14:47:55 -0800 (PST)
Date: Fri, 10 Nov 2023 14:47:54 -0800
In-Reply-To: <20231110220756.7hhiy36jc6jiu7nm@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com>
 <20231016132819.1002933-49-michael.roth@amd.com> <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
 <ZS614OSoritrE1d2@google.com> <b9da2fed-b527-4242-a588-7fc3ee6c9070@amd.com>
 <ZS_iS4UOgBbssp7Z@google.com> <20231110220756.7hhiy36jc6jiu7nm@amd.com>
Message-ID: <ZU6zGgvfhga0Oiob@google.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, Dionna Amalie Glaze <dionnaglaze@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 10, 2023, Michael Roth wrote:
> On Wed, Oct 18, 2023 at 06:48:59AM -0700, Sean Christopherson wrote:
> > On Wed, Oct 18, 2023, Alexey Kardashevskiy wrote:
> > Anyways, back to punting to userspace.  Here's a rough sketch.  The only new uAPI
> > is the definition of KVM_HC_SNP_GET_CERTS and its arguments.
> 
> This sketch seems like a good, flexible way to handle per-VM certs, but
> it does complicate things from a userspace perspective. As a basic
> requirement, all userspaces will need to provide a way to specify the
> initial blob (either a very verbose base64-encoded userspace cmdline param,
> or a filepatch that needs additional management to store and handle
> permissions/etc.), and also a means to update it (e.g. a HMP/QMP command
> for QEMU, some libvirt wrappers, etc.).
>
> That's all well and good if you want to make use of per-VM certs, but we
> don't necessarily expect that most deployments will necessarily want to deal
> with per-VM certs, and would be happy with a system-wide one where they could
> simply issue the /dev/sev ioctl to inject one automatically for all guests.
> 
> So we're sort of complicating the more common case to support a more niche
> one (as far as userspace is concerned anyway; as far as kernel goes, your
> approach is certainly simplest :)).
> 
> Instead, maybe a compromise is warranted so the requirements on userspace
> side are less complicated for a more basic deployment:
> 
>   1) If /dev/sev is used to set a global certificate, then that will be
>      used unconditionally by KVM, protected by simple dumb mutex during
>      usage/update.
>   2) If /dev/sev is not used to set the global certificate is the value
>      is NULL, we assume userspace wants full responsibility for managing
>      certificates and exit to userspace to request the certs in the manner
>      you suggested.
> 
> Sean, Dionna, would this cover your concerns and address the certificate
> update use-case?

Honestly, no.  I see zero reason for the kernel to be involved.  IIUC, there's no
privileged operations that require kernel intervention, which means that shoving
a global cert into /dev/sev is using the CCP driver as middleman.  Just use a
userspace daemon.  I have a very hard time believing that passing around large-ish
blobs of data in userspace isn't already a solved problem.
