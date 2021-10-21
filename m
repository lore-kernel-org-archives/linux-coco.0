Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A202C81
	for <linux-coco@lists.linux.dev>; Thu, 21 Oct 2021 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634838476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdVy6FwDaq466AExZNtZZOl0E2m/+xf4V5tJYwOKByc=;
	b=eugDPjAcOFmIxVsh4ad+0OdKhkR40/LvJTeI92IFk1pXjalZ2RP0xkxKAvn397qtP222t2
	Qz76xSDgujap/RGCf22oabsaRZ8CONB3e2Tbw77TLgTeDR1C5+PoPNp7uUsAzzeLxO3VvH
	FmU4u0Ghc36bQRFYU4zTe7ieDmPQNI8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-n3k5uyPBObSSiwvpZiC5Qw-1; Thu, 21 Oct 2021 13:47:55 -0400
X-MC-Unique: n3k5uyPBObSSiwvpZiC5Qw-1
Received: by mail-wm1-f69.google.com with SMTP id s26-20020a7bc39a000000b0030d9db6c428so170035wmj.6
        for <linux-coco@lists.linux.dev>; Thu, 21 Oct 2021 10:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sdVy6FwDaq466AExZNtZZOl0E2m/+xf4V5tJYwOKByc=;
        b=YkvQc4Hqua0UVO2/INkGAM6IIa2w2w8rV+jac6ZMiFqdxytl6IohrfTqH8rd67ry8t
         h5dYmreyEGeThKZQSTpaDvO2m/YT3TONVIuOHaoEAG7k49ksaXNvN9veH+JYuDPe7iMF
         vvR5w/10ivumyRpsuBQtkBM/n/zVg8wiDukXBbq89q2Dy5CtHDTmHmlPYD2Whnswu2U3
         wWHi6L/TAB4wztjDyojWqAz3g6FVVtQGbQGMrTwX2g4H0dQiJeCRDrODPnO/oIMA6Js3
         L/JoOsMdiTWZqgNMXeCuiJKMgvrEIChgNSaaILpaXVJOwRUPU3zb3A1pb89kRyCg1g+B
         QRLA==
X-Gm-Message-State: AOAM533Ilu+NKKXIrl86A8kvOFh657PgqrmfwAEYoJ4p4U0OGdmKgahC
	tTl1ghxkQ0tzg8HdsZ6BdZFItcRHtqfmY1Qfr8QcuCH5Tkp1vXqBleuxNxPRai+2Ngsj+fFGwgO
	tMc37VtbdGOGnX9yIHB7o5g==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr23050404wmi.113.1634838473755;
        Thu, 21 Oct 2021 10:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrJOA3K2+jcEdUJkI5yUOvDRbh0LHvWJK/dSXnO5HgNUEG6KoK85UuOyllpMd1Zyh5XoN7lA==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr23050368wmi.113.1634838473557;
        Thu, 21 Oct 2021 10:47:53 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id l40sm6144308wms.31.2021.10.21.10.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:47:52 -0700 (PDT)
Date: Thu, 21 Oct 2021 18:47:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Michael Roth <michael.roth@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v6 08/42] x86/sev-es: initialize sev_status/features
 within #VC handler
Message-ID: <YXGnxs0hV3IKGDwP@work-vm>
References: <20211008180453.462291-9-brijesh.singh@amd.com>
 <YW2EsxcqBucuyoal@zn.tnic>
 <20211018184003.3ob2uxcpd2rpee3s@amd.com>
 <YW3IdfMs61191qnU@zn.tnic>
 <20211020161023.hzbj53ehmzjrt4xd@amd.com>
 <YXF9sCbPDsLwlm42@zn.tnic>
 <YXGNmeR/C33HvaBi@work-vm>
 <YXGbcqN2IRh9YJk9@zn.tnic>
 <YXGflXdrAXH5fE5H@work-vm>
 <YXGlPf5OTPzp09qr@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YXGlPf5OTPzp09qr@zn.tnic>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Borislav Petkov (bp@alien8.de) wrote:
> On Thu, Oct 21, 2021 at 06:12:53PM +0100, Dr. David Alan Gilbert wrote:
> > OK, so that bit is 8...21 Eax ext2eax bit 6 page 1-109
> > 
> > then 2.1.5.3 CPUID policy enforcement shows 8...21 EAX as
> > 'bitmask'
> > 'bits set in the GuestVal must also be set in HostVal.
> > This is often applied to feature fields where each bit indicates
> > support for a feature'
> > 
> > So that's right isn't it?
> 
> Yap, AFAIRC, it would fail the check if:
> 
> (GuestVal & HostVal) != GuestVal
> 
> and GuestVal is "the CPUID result value created by the hypervisor that
> it wants to give to the guest". Let's say it clears bit 6 there.
                                               ^^^^^^^

> Then HostVal comes in which is "the actual CPUID result value specified
> in this PPR" and there the guest catches the HV lying its *ss off.
> 
> :-)

Hang on, I think it's perfectly fine for it to clear that bit - it just
gets caught if it *sets* it (i.e. claims to be a chip unaffected by the
bug).

i.e. if guestval=0 then (GustVal & whatever) == GuestVal
  fine

?

Dave

> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

