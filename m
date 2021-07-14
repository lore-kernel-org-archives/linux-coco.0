Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE772
	for <linux-coco@lists.linux.dev>; Wed, 14 Jul 2021 18:14:54 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 77so2491817qkk.11
        for <linux-coco@lists.linux.dev>; Wed, 14 Jul 2021 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3WKLZGhjXG90Fatu5wm7XoigXrQeEPeI0ZySxgtrf1E=;
        b=K34aiEbq6IThsKWJBJDDGsckcOYXonTslRsCf6xEi7ghhFV+UbwNIfzQP6Tq5ldAxz
         x/gfvgeDt8i9UmUFByP8JylSs7uppp+LheXconENxXR/wPDkP+0iUfG5YhfwPEmQU1fy
         4tTjvgWpmY3o7IvTFaQR7Z34VuSgQbU+YmK0iN4AE41bZtFsm7nGfsIz6oRpkXpW6axf
         6b+9SsmHKDPDXxNXQY2L0ih10uAe1HpuGUVydXvTdbXoxG4rjZrIfD2Nskrohj6TdZDI
         j2Q+YXsv7xUpGHDh1ZKrJ93dEG0SbTKyIkbyJdcn2EcTIo/QYOSql+60mVB0ixujp++K
         tFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3WKLZGhjXG90Fatu5wm7XoigXrQeEPeI0ZySxgtrf1E=;
        b=I/2dJIFE6PO28gZ7ANoho2E/pHLnjwXe2L7iIzxr9DQ4erD8ttKAgcrPFzZ7/rrIWU
         gEKmPVbRNwXWIm7sZgDCcJP4aQvq0I3Qn8AsynTsG7uj3dC533eCbO5gVtbZobKR7x5E
         AlkOG3JMoXNdK2a8ReDQ4VmwKCze+DxYGfEG9RrZmILVwUdk78J2MgDKv0AkrsSEfnyi
         XTopNU6JyvuWwizg8y7ui9lcnP/7aY2STTtU+T5vTZ1KU+pknsXIWvoORirATmVLSKxD
         bZPz6tlCxxt26kWVbMmce/xE2+h2QKaCVovj4oAUo1seJ8Q9YIKcH6yFBRUkgw2E6D1y
         MHJg==
X-Gm-Message-State: AOAM531IdszCsl7yBRzFtaZsXAEyw1Kv76/8w2OnfBH9k001XUWbtmh7
	jWLxZrJFVS8z0a75zaAcH/CIKZnSd4CfQLuJpT5dlQ==
X-Google-Smtp-Source: ABdhPJxM1wp8nSe3bkx8dg/pQpdxw78kl5esOD57NTfXsDoAxivKWcg01aZjKeev4L+fz4X+d7136TERrs+FRe6NY50=
X-Received: by 2002:a05:620a:a90:: with SMTP id v16mr11085310qkg.150.1626286493309;
 Wed, 14 Jul 2021 11:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210707183616.5620-1-brijesh.singh@amd.com> <20210707183616.5620-16-brijesh.singh@amd.com>
 <CAA03e5HA_vjhOtTPL-vKFJvPxseLRMs5=s90ffUwDWQxtG7aCQ@mail.gmail.com> <98ac737d-83a8-6ee8-feac-554bab673191@amd.com>
In-Reply-To: <98ac737d-83a8-6ee8-feac-554bab673191@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Wed, 14 Jul 2021 11:14:41 -0700
Message-ID: <CAA03e5EKn=X28jKwK10V2MxY9e5Kj0+8obG4vnU=X8oooNzRxQ@mail.gmail.com>
Subject: Re: [PATCH Part2 RFC v4 15/40] crypto: ccp: Handle the legacy TMR
 allocation when SNP is enabled
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com, 
	npmccallum@redhat.com, brijesh.ksingh@gmail.com, 
	Alper Gun <alpergun@google.com>
Content-Type: text/plain; charset="UTF-8"

> > Should this return a non-zero value -- maybe `-ENODEV`? Otherwise, the
> > `snp_alloc_firmware_page()` API will return a page that the caller
> > believes is suitable to use with FW. My concern is that someone
> > decides to use this API to stash a page very early on during kernel
> > boot and that page becomes a time bomb.
>
> But that means the caller now need to know that SNP is enabled before
> calling the APIs. The idea behind the API was that caller does not need
> to know whether the firmware is in the INIT state. If the firmware has
> initialized the SNP, then it will transparently set the immutable bit in
> the RMP table.

For SNP, isn't that already the case? There are three scenarios:

#1: The PSP driver is loaded and `snp_inited` is `true`: These returns
are never hit.

#2: The PSP driver is not loaded. The first return, `!psp ||
!psp->sev_data` fires. As written, it returns `0`, indicating success.
However, we never called RMPUPDATE on the page. Thus, later, when the
PSP driver is loaded, the page that was previously returned as usable
with FW is in fact not usable with FW. Unless SNP is disabled (e.g.,
SEV, SEV-ES only). In which case I guess the page is OK.

#3 The PSP driver is loaded but the SNP_INIT command has not been
issued. Looking at this again, I guess `return 0` is OK. Because if we
got this far, then `sev_pci_init()` has been called, and the SNP_INIT
command has been issued if we're supporting SNP VMs.

So in summary, I think we should change the first return to return an
error and leave the 2nd return as is.

> > If we initialize `rc` to `-ENODEV` (or something similar), then every
> > return in this function can be `return rc`.
> >
> >> +
> >> +       /* If SEV-SNP is initialized then add the page in RMP table. */
> >> +       sev = psp->sev_data;
> >> +       if (!sev->snp_inited)
> >> +               return 0;
> >
> > Ditto. Should this turn a non-zero value?
> >
> >> +
> >> +       while (pfn < pfn_end) {
> >> +               if (need_reclaim)
> >> +                       if (snp_reclaim_page(pfn_to_page(pfn), locked))
> >> +                               return -EFAULT;
> >> +
> >> +               rc = rmpupdate(pfn_to_page(pfn), val);
> >> +               if (rc)
> >> +                       return rc;
> >> +
> >> +               pfn++;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
