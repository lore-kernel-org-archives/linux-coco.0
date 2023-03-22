Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E437523D4
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679481248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rVkLd1gXXSaNzOK+vQH5hpvFlsKrXbqvBvpTSZkuN40=;
	b=asFrKw/uTOX8dFdq4RWzdMHrkxE7a7SCC8/jkRxMXDk2gtNOnjUb4gTLmKoHI5Dxdmi/XS
	h7JrjkZfSJj0NyzlnEvDkNzBk86Lx7/VCpjvcoDAS0Y9sjzdnI9u9+Wj082JXo1n30p6d5
	xIthBPUrfAiTEDuOETdkHcvh2j/qNAA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-iO875wDhODOU8WJKT1QDCA-1; Wed, 22 Mar 2023 06:34:05 -0400
X-MC-Unique: iO875wDhODOU8WJKT1QDCA-1
Received: by mail-wm1-f72.google.com with SMTP id o7-20020a05600c4fc700b003edf85f6bb1so4330607wmq.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679481244;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVkLd1gXXSaNzOK+vQH5hpvFlsKrXbqvBvpTSZkuN40=;
        b=CiCaoaRRpR3duq5rwRc/UZBUb2BUhBHNKSgrr/I8V8Q0CXs7TkSCmvRV//7c30EPcD
         AgG1dschP1CWnSATSxB4zoEXdDIBM8bmWRrJg+4651LZwp89hDROLFXfns5clvYM6J1Y
         3EpDu80hTFWfp7F4zJzsRCiW5GsarcIri/Wtn/er1wIsV381pbCeoMtYbMmP/ffWFqbA
         Nys7ldsizYcE2J1yoFFAreoxiByURhLOjH/bSDFI1rR17y4RKPEu9MMxuc09960GRq5Q
         clw1BcI9SyI9Lf5UjAEmkXoxp3z4CoXnW1DRlv4CwnLS5dRFQxhmn1oe5BwLWd1Y9aBe
         Fzag==
X-Gm-Message-State: AO0yUKWSzROV0IRZoXAlbf/2binQx5VAYmcxlsIdupAKY9Rd8pBiwZhd
	GDpCNKwcR7g1V7FZ5TukEVtSIhLxO9BjquYF5cYU3O0dPSDFBwORMAholDJxrnd+DeyGn3iSp6J
	Nu0OHjsvNzxEqkcYptnPbSA==
X-Received: by 2002:a05:600c:cc5:b0:3ed:2346:44bd with SMTP id fk5-20020a05600c0cc500b003ed234644bdmr1267216wmb.19.1679481244576;
        Wed, 22 Mar 2023 03:34:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Thq76pPmJGxOxWXjQQrmoDtwTU00agbKDE5V4x+4LtRlKY6qAlszC5c92Bor2YpNIrUHo5Q==
X-Received: by 2002:a05:600c:cc5:b0:3ed:2346:44bd with SMTP id fk5-20020a05600c0cc500b003ed234644bdmr1267207wmb.19.1679481244334;
        Wed, 22 Mar 2023 03:34:04 -0700 (PDT)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000050a00b002d78a96cf5fsm6368842wrf.70.2023.03.22.03.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:34:04 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:34:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
	amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBrZmbfWXVQLND/E@work-vm>
References: <ZBl4592947wC7WKI@suse.de>
 <ZBnH600JIw1saZZ7@work-vm>
 <ZBnMZsWMJMkxOelX@suse.de>
 <ZBnhtEsMhuvwfY75@work-vm>
 <ZBn/ZbFwT9emf5zw@suse.de>
 <ZBoLVktt77F9paNV@work-vm>
 <ZBrIFnlPeCsP0x2g@suse.de>
 <444b0d8d-3a8c-8e6d-1df3-35f57046e58e@amazon.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <444b0d8d-3a8c-8e6d-1df3-35f57046e58e@amazon.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Alexander Graf (graf@amazon.com) wrote:
> Hi Jörg,
> 
> On 22.03.23 10:19, Jörg Rödel wrote:
> 
> > On Tue, Mar 21, 2023 at 07:53:58PM +0000, Dr. David Alan Gilbert wrote:
> > > OK; the other thing that needs to get nailed down for the vTPM's is the
> > > relationship between the vTPM attestation and the SEV attestation.
> > > i.e. how to prove that the vTPM you're dealing with is from an SNP host.
> > > (Azure have a hack of putting an SNP attestation report into the vTPM
> > > NVRAM; see
> > > https://github.com/Azure/confidential-computing-cvm-guest-attestation/blob/main/cvm-guest-attestation.md
> > > )
> > When using the SVSM TPM protocol it should be proven already that the
> > vTPM is part of the SNP trusted base, no? The TPM communication is
> > implicitly encrypted by the VMs memory key and the SEV attestation
> > report proves that the correct vTPM is executing.
> 
> 
> What you want to achieve eventually is to take a report from the vTPM and
> submit only that to an external authorization entity that looks at it and
> says "Yup, you ran in SEV-SNP, I trust your TCB, I trust your TPM
> implementation, I also trust your PCR values" and based on that provides
> access to whatever resource you want to access.
> 
> To do that, you need to link SEV-SNP and TPM measurements/reports together.
> And the easiest way to do that is by providing the SEV-SNP report as part of
> the TPM: You can then use the hash of the SEV-SNP report as signing key for
> example.

Yeh; I think the SVSM TPM protocol has some proof of that as well; the
SVSM spec lists 'SVSM_ATTEST_SINGLE_SERVICE Manifest Data' that contains
'TPMT_PUBLIC structure of the endorsement key'.
So I *think* that's saying that the SEV attestation report contains
something from the EK of the vTPM.

> I think the key here is that you need to propagate that link to an external
> party, not (only) to the VM.

Yeh.

Dave
> 
> 
> Alex
> 
> 
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

