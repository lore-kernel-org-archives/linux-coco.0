Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBF816B73D
	for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716892795; cv=none; b=I+/m0r5uN+u0qKtxrQDnYVBnFYpqpRQZMBDvPHqHQM4ZPXqVCB3dKrJg8fu5uz9MYRz/a9Vm9NJAZGM1DTy4ynT5ydZXKIbNGX7ia6STZ71/fy5a6fWZ7oI435bLysAA0EPiZXCheBcVQ5yAvAbf4tso2uwq2LiYoeqlqTswu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716892795; c=relaxed/simple;
	bh=aj45SEB7D9ldygzhYKXe3HytaBUsioM0atiT5UJiPD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/stb2kXUeAgSt86SSWzyzbCAiN+fUY/JnC4m0HAleGEVzC6XxVD0CpUA1YEQ5Tyxs6VMslcvDN1h/P1gfVSNhzWjzI/v9/yOD5WB1T4QIpsmW/owSrojaIzQsCZRflnPXHAbq5ws0mOwfh7O9P8C6e7gxwowZAEIeT+g5tyxT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+tkLP95; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+tkLP95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716892792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWr5rLzhCiKZuwW7h7YBmazKG48r0xrDo/cGy6it0/4=;
	b=U+tkLP95NJucXVQjKEObOikJIObI5xa8SLu1c0e0+nLGYFIh+D6YsI1XSh6c07B81CEXKc
	M2cJVoqsxSMNp2SFVzphurT7KGN8M1jlr4umi/8lPEE9euuDX5+4fFH63YCLLsT1NCUACs
	IQIYB2Da17MD1wQ7h/WOJDORqEKYkE0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-9CVWIcOnPa-fDhhqG6xQrQ-1; Tue, 28 May 2024 06:39:50 -0400
X-MC-Unique: 9CVWIcOnPa-fDhhqG6xQrQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3580f213373so520359f8f.3
        for <linux-coco@lists.linux.dev>; Tue, 28 May 2024 03:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716892789; x=1717497589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWr5rLzhCiKZuwW7h7YBmazKG48r0xrDo/cGy6it0/4=;
        b=RBPpXhpzdzs1oHDFZfCXDGKpMCcSCSe5QChHiDQFHGhj4s/q+8gIWYGqfWZjuy3WPw
         gT7V2RtnQL+q5dFD8oeUZJJx8jkJ+Ljl213tWC3SV8EblQVKid2720PiWjXEFKC5Y/Od
         As1GTkdoBpvPKShSAMh2ue+ebl/n9JgzQ66A89eYFSKQTbvuO2xzutzPee9/X4g0dsFY
         nL4qoO9/fV4Dr44ZAneOK3lXWr4frDhYeFD4iVabLmYzBqIcvTD0hnFn6NnWLd36pQGl
         XHEV6okpXTwkDnSnCUT57wioyAbkphXH3CfGEEFaoepnOuj1iSsdwiKcZFAQGO/ptCNx
         441Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWBR93Cxw+0U3At+uMs8HahIw9XCttbNkN2Ksduf/nr8UFTYffa4YRoO1BqsnHgZz3sFaPDfvdGfFD22Vpzrk6qawQZQtt+KJ+vA==
X-Gm-Message-State: AOJu0YzhPcsCW1iIyJLm7/UdKSrf7obDKDMsFynXcuhq/gMvZxKRnctp
	/TBVERnD1Ds6C/duhJZJXi6mVTJ7+Vg5Iju+IUZvCeuE+Zd4itPKTjfHuBOk6jTLQdRmjok/2yG
	NxF1Dz99XnQ5OyGgBboD+4IMJ30qS/YfYogD8RNOPlFRkJnHzb9jlOcmtpfaUVVw0p5udQMxnm+
	tWgwFixjjpxN0KOEROIqAuAiNpePSr7/F9TA==
X-Received: by 2002:adf:f605:0:b0:351:d78e:875e with SMTP id ffacd0b85a97d-35526c271e2mr7836489f8f.14.1716892788873;
        Tue, 28 May 2024 03:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4hqokdTCBlYq+yxpXGdOajfvNiw6vsJ+NmirTpEeZTh+x8A7CTg2keuO9ed6PBfJTW5YEfW34ZoQ5qL3Gp5w=
X-Received: by 2002:adf:f605:0:b0:351:d78e:875e with SMTP id
 ffacd0b85a97d-35526c271e2mr7836445f8f.14.1716892788425; Tue, 28 May 2024
 03:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240501085210.2213060-10-michael.roth@amd.com> <84e8460d-f8e7-46d7-a274-90ea7aec2203@linux.intel.com>
 <CABgObfaXmMUYHEuK+D+2E9pybKMJqGZsKB033X1aOSQHSEqqVA@mail.gmail.com>
 <7d6a4320-89f5-48ce-95ff-54b00e7e9597@linux.intel.com> <rczrxq3lhqguarwh4cwxwa35j5riiagbilcw32oaxd7aqpyaq7@6bqrqn6ontba>
 <7da9c4a3-8597-44aa-a7ad-cc2bd2a85024@linux.intel.com>
In-Reply-To: <7da9c4a3-8597-44aa-a7ad-cc2bd2a85024@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 May 2024 12:39:36 +0200
Message-ID: <CABgObfajCDkbDbK6-QyZABGTh=5rmE5q3ifvHfZD1A2Z+u0v3A@mail.gmail.com>
Subject: Re: [PATCH v15 09/20] KVM: SEV: Add support to handle MSR based Page
 State Change VMGEXIT
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	seanjc@google.com, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 2:26=E2=80=AFPM Binbin Wu <binbin.wu@linux.intel.co=
m> wrote:
> > It seems like TDX should be able to do something similar by limiting th=
e
> > size of each KVM_HC_MAP_GPA_RANGE to TDX_MAP_GPA_MAX_LEN, and then
> > returning TDG_VP_VMCALL_RETRY to guest if the original size was greater
> > than TDX_MAP_GPA_MAX_LEN. But at that point you're effectively done wit=
h
> > the entire request and can return to guest, so it actually seems a litt=
le
> > more straightforward than the SNP case above. E.g. TDX has a 1:1 mappin=
g
> > between TDG_VP_VMCALL_MAP_GPA and KVM_HC_MAP_GPA_RANGE events. (And eve=
n
> > similar names :))
> >
> > So doesn't seem like there's a good reason to expose any of these
> > throttling details to userspace,

I think userspace should never be worried about throttling. I would
say it's up to the guest to split the GPA into multiple ranges, but
that's not how arch/x86/coco/tdx/tdx.c is implemented so instead we
can do the split in KVM instead. It can be a module parameter or VM
attribute, establishing the size that will be processed in a single
TDVMCALL.

Paolo

>
> The reasons I want to put the throttling in userspace are:
> 1. Hardcode the TDX_MAP_GPA_MAX_LEN in kernel may not be preferred.
> 2. The throttling thing doesn't need to be TDX specific, it can be
> generic in userspace.
>
> I think we can set a reasonable value in userspace, so that for SNP, it
> doesn't trigger the throttling since the large request will be split to
> multiple userspace requests.
>
>
> > in which case existing
> > KVM_HC_MAP_GPA_RANGE interface seems like it should be sufficient.
> >
> > -Mike
> >
> >>
> >>>> For TDX, it may also want to use KVM_HC_MAP_GPA_RANGE hypercall  to
> >>>> userspace via KVM_EXIT_HYPERCALL.
> >>> Yes, definitely.
> >>>
> >>> Paolo
> >>>
>

