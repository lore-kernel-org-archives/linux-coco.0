Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD612838C
	for <linux-coco@lists.linux.dev>; Tue, 16 Apr 2024 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713268422; cv=none; b=WbBS30elaUhO9KbOrcw3IEl7qzJCB2OuMtBrlAlFsDjvU4hm1U2Jhpp1rrHyrlIk3ERpA/aWAzLlEEhVxRJDj8iR2zgUSaGFXrrJ312KgipcaxcG33kal87utpf0+5qowIO+v3QJSWwXrBqpXWeWQlgyh94BbF3izxR46k+mKBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713268422; c=relaxed/simple;
	bh=2B/0TZrDQ88vv16W4Pq06pS4UHrWwoD7Zfiru7x/BQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8rTklOjYN3UTSuSSGjjuyKhGRxCcIO0WuP+zoSDELnXBHh3rBgknboRNdGcYeVECa5gVTy2v9/x5zqD5sNreo8xoMDiOD+H0GYUaJTt2DY+Jw87Sl68PyoabBbsi/7qHDas0uy8PNKpASczb6G6R1UE8A1BrUwxYp/ahWKZmGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOOfRSOf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOOfRSOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713268420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ux9rBA1E+x/XqOx1Zfa/TZpS8q2CNQskPcvct4f8Ic=;
	b=FOOfRSOftFf7fhoMc4TpIQezLMhUYYtKJfhT0Selmj8q1YxzZhQVzkda4t2WnOHO46k9jB
	Bqcrx915UQ8sIZTSoGOWb5TLLlVKoyPrGLtOxgPbaDn0JQj98351b46tZ9Jn611/oioAmn
	2sSaITtBcglV/aT0vNIYR6h3xGhHxYA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-4qknxS3NOXmmBlOm77BvjA-1; Tue, 16 Apr 2024 07:53:37 -0400
X-MC-Unique: 4qknxS3NOXmmBlOm77BvjA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-343bc1e4ef3so3303632f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 16 Apr 2024 04:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713268416; x=1713873216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ux9rBA1E+x/XqOx1Zfa/TZpS8q2CNQskPcvct4f8Ic=;
        b=pCeo7xI7iIsuFIILqz53584l6NmzqJ8Iy538/BimtxpVnuR4mg2Mkpy+52RhsJzt/7
         6fCBTOJdxtaKBFxC2WU3Z+3rw/KjdTbZLLozof9nuetTZ/p0FHVPHfd5MZny76q+HT6Y
         gFGdH4QI6fpOcxRSjTj/+dQ16gSHVAfYCKM9gTd50WcmXsWQ2mnQi721Ght6VRUxgYqT
         4rQZ4znSSp8vT6MMMcfcY0UIG9oRmVTj2OrXPk3QqsFWIZVSgEYO0H8sIvpaQ1bRVQ3W
         lRXJjUEr92w+D2gH2WB18YGwaNMtBg6o0Bgh/jQaTgwjiWShO+gtiG43brNORsLH98V3
         XdyQ==
X-Gm-Message-State: AOJu0YzwuIZV5Ixfwft1hauYSQdofse+HKXtgOacIY7npd0P4wixkarF
	l6sUhFqTkAUacBoGzm1PlscjI3smFZEz0sHR4m+RDdc+ljt9jce9dn3inCoCihF6EEOl18hFrQ4
	ZRdePssKZvPo/s7+tw4/i7Xjue3tn2P8+JoQCrpYDvPlHqDbSWrVZ+i1OR9jh0BKRHNB+3E9J2u
	PeB0x53hfbP/tBcaHQtGi5WqCAzcuqnyxJDA==
X-Received: by 2002:adf:cd11:0:b0:348:b435:2736 with SMTP id w17-20020adfcd11000000b00348b4352736mr1845180wrm.51.1713268416621;
        Tue, 16 Apr 2024 04:53:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHboei6CWQ68/kX4VWiS3hHyg54DT0hUEvoN+DvTUse7RMopQtT/6X8ZHkV5bkVVsxqb/R4glDVv0DZOX9sF8E=
X-Received: by 2002:adf:cd11:0:b0:348:b435:2736 with SMTP id
 w17-20020adfcd11000000b00348b4352736mr1845167wrm.51.1713268416287; Tue, 16
 Apr 2024 04:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329225835.400662-1-michael.roth@amd.com> <20240329225835.400662-19-michael.roth@amd.com>
 <67685ec7-ca61-43f1-8ecd-120ec137e93a@redhat.com>
In-Reply-To: <67685ec7-ca61-43f1-8ecd-120ec137e93a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Apr 2024 13:53:24 +0200
Message-ID: <CABgObfZNVR-VKst8dDFZ4gs_zSWE8NE2gj5-Y4TNh0AnBfti7w@mail.gmail.com>
Subject: Re: [PATCH v12 18/29] KVM: SEV: Use a VMSA physical address variable
 for populating VMCB
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, seanjc@google.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2024 at 10:01=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> On 3/29/24 23:58, Michael Roth wrote:
> > From: Tom Lendacky<thomas.lendacky@amd.com>
> >
> > In preparation to support SEV-SNP AP Creation, use a variable that hold=
s
> > the VMSA physical address rather than converting the virtual address.
> > This will allow SEV-SNP AP Creation to set the new physical address tha=
t
> > will be used should the vCPU reset path be taken.
> >
> > Signed-off-by: Tom Lendacky<thomas.lendacky@amd.com>
> > Signed-off-by: Ashish Kalra<ashish.kalra@amd.com>
> > Signed-off-by: Michael Roth<michael.roth@amd.com>
> > ---
>
> I'll get back to this one after Easter, but it looks like Sean had some
> objections at https://lore.kernel.org/lkml/ZeCqnq7dLcJI41O9@google.com/.

So IIUC the gist of the solution here would be to replace

   /* Use the new VMSA */
   svm->sev_es.vmsa_pa =3D pfn_to_hpa(pfn);
   svm->vmcb->control.vmsa_pa =3D svm->sev_es.vmsa_pa;

with something like

   /* Use the new VMSA */
   __free_page(virt_to_page(svm->sev_es.vmsa));
   svm->sev_es.vmsa =3D pfn_to_kaddr(pfn);
   svm->vmcb->control.vmsa_pa =3D __pa(svm->sev_es.vmsa);

and wrap the __free_page() in sev_free_vcpu() with "if
(!svm->sev_es.snp_ap_create)".

This should remove the need for svm->sev_es.vmsa_pa. It is always
equal to svm->vmcb->control.vmsa_pa anyway.

Also, it's possible to remove

   /*
    * gmem pages aren't currently migratable, but if this ever
    * changes then care should be taken to ensure
    * svm->sev_es.vmsa_pa is pinned through some other means.
    */
   kvm_release_pfn_clean(pfn);

if sev_free_vcpu() does

   if (svm->sev_es.snp_ap_create) {
     __free_page(virt_to_page(svm->sev_es.vmsa));
   } else {
     put_page(virt_to_page(svm->sev_es.vmsa));
   }

and while at it, please reverse the polarity of snp_ap_create and
rename it to snp_ap_created.

Paolo

