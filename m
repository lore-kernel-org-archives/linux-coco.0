Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B58F58
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679507282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhZPzg78/5kFcAui9iEGj7X/bYxMHqk5tWZO5iu8MDk=;
	b=PXkKaGtxl3uwEeLxd9lfj+2B5bYP/7DV5UJAGSsW2Xag9tRNgfElBCx5OXsUEo2QIcOQsz
	jdFi5ZZrj2o70opYNdniWma0b4E/vK6w3jvNOgjLOlu2lWbYzg3uy2bCrh7POCzNFANoTj
	giECUnxdiuw9PDoNppCD0ZS34PONDSY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-0sDCz5iJP7WO5wjbLWt_Bw-1; Wed, 22 Mar 2023 13:48:01 -0400
X-MC-Unique: 0sDCz5iJP7WO5wjbLWt_Bw-1
Received: by mail-wm1-f71.google.com with SMTP id o37-20020a05600c512500b003edd119ec9eso5685861wms.0
        for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 10:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507280;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhZPzg78/5kFcAui9iEGj7X/bYxMHqk5tWZO5iu8MDk=;
        b=jjF6CuqWzVB58lv3MNPpvBXK9QJ4ITTh7ySKgeZakVIKCI+2VSXKUyUYeoAnUILgLv
         K0W8zEii0fVu9/wQVAI+zEnmX2iaNopZ9ZB3slpZsOdhK/Semfzg9XId5RZ+A+LHPMK1
         vouE+/pedRhPK/hA7SRkcSyGMrdMh1QK2LRgCwYXa3W87+VqXHd7s0hF/ohhXa3RT9gw
         A+X2f//EBkHlDyT7M3DwbJE9CO5/RSbCBpM+hVEFn43b24ZBd3DKAFNt9cb/fuBWORy6
         um7l88rg7WZA2V+pHOSSYlSPRUbC5DtbcClMykaB22jWqW+5sFHrdw+HNevu2i4/Utqo
         Oa+A==
X-Gm-Message-State: AO0yUKVSt4GWMOavi4hx9MaWLwgZutWWsxSVjlUNQtRbIAuvOKWI6dMa
	RzOV540R1jXkQ8aZFLUSklQSOVYGQrCOltudRJtKVj5jIX6HMrOgPJopkVu9zMILiB4S2PwuvZk
	7URdAfGYVaugOAUhQtX0jjQ==
X-Received: by 2002:a1c:4c0e:0:b0:3eb:f5a2:2d67 with SMTP id z14-20020a1c4c0e000000b003ebf5a22d67mr265976wmf.33.1679507280072;
        Wed, 22 Mar 2023 10:48:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set+0Ct4GtocbS8VFqVIzSkbRDrCU6P6ydWYsRfmwyYhCHEHC9sYyrS2Zz+R7ms0dItRQLb+yoA==
X-Received: by 2002:a1c:4c0e:0:b0:3eb:f5a2:2d67 with SMTP id z14-20020a1c4c0e000000b003ebf5a22d67mr265969wmf.33.1679507279805;
        Wed, 22 Mar 2023 10:47:59 -0700 (PDT)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003ede03e4369sm12016397wmg.33.2023.03.22.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:47:59 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:47:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Alexander Graf <graf@amazon.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
	amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBs/TX4eDuj5zc3+@work-vm>
References: <ZBl4592947wC7WKI@suse.de>
 <ZBnH600JIw1saZZ7@work-vm>
 <ZBnMZsWMJMkxOelX@suse.de>
 <ZBnhtEsMhuvwfY75@work-vm>
 <ZBn/ZbFwT9emf5zw@suse.de>
 <ZBoLVktt77F9paNV@work-vm>
 <ZBrIFnlPeCsP0x2g@suse.de>
 <444b0d8d-3a8c-8e6d-1df3-35f57046e58e@amazon.com>
 <ZBrZmbfWXVQLND/E@work-vm>
 <CAAH4kHbYc+Wx5W_S8XFch+z1B19U_Zm=hFQr1fj1rv1S8QOvxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAH4kHbYc+Wx5W_S8XFch+z1B19U_Zm=hFQr1fj1rv1S8QOvxg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Dionna Amalie Glaze (dionnaglaze@google.com) wrote:
> On Wed, Mar 22, 2023 at 3:34 AM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Alexander Graf (graf@amazon.com) wrote:
> > > Hi Jörg,
> > >
> > > On 22.03.23 10:19, Jörg Rödel wrote:
> > >
> > > > On Tue, Mar 21, 2023 at 07:53:58PM +0000, Dr. David Alan Gilbert wrote:
> > > > > OK; the other thing that needs to get nailed down for the vTPM's is the
> > > > > relationship between the vTPM attestation and the SEV attestation.
> > > > > i.e. how to prove that the vTPM you're dealing with is from an SNP host.
> > > > > (Azure have a hack of putting an SNP attestation report into the vTPM
> > > > > NVRAM; see
> > > > > https://github.com/Azure/confidential-computing-cvm-guest-attestation/blob/main/cvm-guest-attestation.md
> > > > > )
> > > > When using the SVSM TPM protocol it should be proven already that the
> > > > vTPM is part of the SNP trusted base, no? The TPM communication is
> > > > implicitly encrypted by the VMs memory key and the SEV attestation
> > > > report proves that the correct vTPM is executing.
> > >
> > >
> > > What you want to achieve eventually is to take a report from the vTPM and
> > > submit only that to an external authorization entity that looks at it and
> > > says "Yup, you ran in SEV-SNP, I trust your TCB, I trust your TPM
> > > implementation, I also trust your PCR values" and based on that provides
> > > access to whatever resource you want to access.
> > >
> > > To do that, you need to link SEV-SNP and TPM measurements/reports together.
> > > And the easiest way to do that is by providing the SEV-SNP report as part of
> > > the TPM: You can then use the hash of the SEV-SNP report as signing key for
> > > example.
> >
> > Yeh; I think the SVSM TPM protocol has some proof of that as well; the
> > SVSM spec lists 'SVSM_ATTEST_SINGLE_SERVICE Manifest Data' that contains
> > 'TPMT_PUBLIC structure of the endorsement key'.
> > So I *think* that's saying that the SEV attestation report contains
> > something from the EK of the vTPM.
> >
> > > I think the key here is that you need to propagate that link to an external
> > > party, not (only) to the VM.
> >
> > Yeh.
> >
> 
> Excuse my perhaps naivete, but would it not be in the TCG's wheelhouse
> to specify how a TPM's firmware (SVSM) / bootloader (SEV-SNP) should
> be attested? The EK as well?
> 
> I think this might need to jump back to the vTPM protocol thread since
> this is about COCONUT, but I'm worried we're talking about
> AMD-specific long-term formats when perhaps the trusted computing
> group should be widening its scope to how a TPM should be virtualized.
> I appreciate that we're attempting to solve the problem in the short
> term, and certainly the SVSM will need attestation capabilities, but
> the linking to the TPM is dicey without that conversation with TCG,
> IMHO.

Some standardisation of the link between the vTPM and the underlying
CoCo hardware would be great; there's at least 2 or 3 CoCo linked vTPMs
already and I don't think they're sharing any idea of that.

Whether it's TCG I'm not sure; It doesn't seem to me to make sense for
them to specify the flow to bring the vTPM up or the details of the
underlying CoCo's attestation; but standardising how the two processes
are tied together might be possible.

Dave

> > Dave
> > >
> > >
> > > Alex
> > >
> > >
> > >
> > >
> > >
> > > Amazon Development Center Germany GmbH
> > > Krausenstr. 38
> > > 10117 Berlin
> > > Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> > > Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> > > Sitz: Berlin
> > > Ust-ID: DE 289 237 879
> > >
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
> 
> 
> -- 
> -Dionna Glaze, PhD (she/her)
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

