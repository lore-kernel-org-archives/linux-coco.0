Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE5107A3
	for <linux-coco@lists.linux.dev>; Thu,  5 Jan 2023 22:08:59 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id c133so33193392oif.1
        for <linux-coco@lists.linux.dev>; Thu, 05 Jan 2023 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bn7Z6oDABvJGYJVlfHzj/OFR2MilP9KE/xPylqtRaI8=;
        b=LPsmEqdAF17ASsCpSdQFeo9d4yZM+w20RGOPe9inlsD+sZCird0lne6ib9WTiUsoq6
         2YgzaklAwt7/d/G7TwXebs7qINP7lo6g4gokBAoTDbEuLNRCPOur2bdGaSB5436CIeQq
         ow56Fuel0bIs5L34wyTU1If5GO/VcfHRlBWxOg8w8qsR3+7n9GR21BPqtWii9RShhyO4
         sK4o0wllJQDfn0fBTBRKdj+90uTkehVGEmVCx2XkcMotlGcWsc49QFRAovOssriMnEgU
         2rvFg916i1tZO2H3RWKP5p1gJ4gYmWV4zvrIbxxpj3BvvCGMhW7SujCWmA146HEcnYhg
         iNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bn7Z6oDABvJGYJVlfHzj/OFR2MilP9KE/xPylqtRaI8=;
        b=iI7WHnywIcAyNjQCe3ZBv2fcIa0oSvG9EJnGNTEiRvedZxPU44MZyh1Nb9qG5paekQ
         dP4ktKbtzDanITEUAYEZXsw90In4GNcPSqWscs4zZ5LyH/m7DcD8uyj03f4BgGwV2LpN
         EDVccQUxn6tBJEZuBvh49XUaqZOKwjIrIw3HC7tAsrdnL+QfUmRY/KE2CTRiIksXcL9V
         1aVWjkkORDyfZUAEnlG4b0NKK0/RZyS2DA+4sHwXoUp/LQyN8VQ8h1e4AokOoTigTq6r
         u3pyrDN/T1hPdQHDybVoXxP8CxHGBnKtvoYENLN+jmO2vyagja0HA4BMEzEuC1kMIUwa
         jF1g==
X-Gm-Message-State: AFqh2kpO9AySEA8gBvGtFAcEMOeHAgsFAvGGzjEVCPOyhtdHgpLon1P4
	HhphhNQJpUQeHmV7V2SMRpLA0cKMZJ4emYIZDRHSfw==
X-Google-Smtp-Source: AMrXdXuxkMBtlIcBn4GdWW98m54t/OKdTbEuF+GncEMuoeBfYSSzt5Own7F/lydDPhj0/ruVF7sknqqThK7mIt4x8Js=
X-Received: by 2002:a05:6808:3947:b0:354:7fd4:f17b with SMTP id
 en7-20020a056808394700b003547fd4f17bmr2403497oib.221.1672956538794; Thu, 05
 Jan 2023 14:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <243778c282cd55a554af9c11d2ecd3ff9ea6820f.1655761627.git.ashish.kalra@amd.com>
 <YuFvbm/Zck9Tr5pq@zn.tnic> <20221219150026.bltiyk72pmdc2ic3@amd.com>
 <Y6DEv4QuvIfwWlCW@zn.tnic> <ab96e918-c8b7-67d5-1dfd-320264858cec@amd.com>
In-Reply-To: <ab96e918-c8b7-67d5-1dfd-320264858cec@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 5 Jan 2023 14:08:47 -0800
Message-ID: <CAA03e5GKCcevo7goyyRqWrgk3KeFPTddb-E2pRmgDmyPSNxDvA@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 07/49] x86/sev: Invalid pages from direct map
 when adding it to RMP table
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, vbabka@suse.cz, kirill@shutemov.name, 
	ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	dgilbert@redhat.com, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 27, 2022 at 1:49 PM Kalra, Ashish <ashish.kalra@amd.com> wrote:
>
> Hello Boris,
>
> On 12/19/2022 2:08 PM, Borislav Petkov wrote:
> > On Mon, Dec 19, 2022 at 09:00:26AM -0600, Michael Roth wrote:
> >> We implemented this approach for v7, but it causes a fairly significant
> >> performance regression, particularly for the case for npages > 1 which
> >> this change was meant to optimize.
> >>
> >> I still need to dig in a big but I'm guessing it's related to flushing
> >> behavior.
> >
> > Well, AFAICT, change_page_attr_set_clr() flushes once at the end.
> >
> > Don't you need to flush when you modify the direct map?
> >
>
> Milan onward, there is H/W support for coherency between mappings of the
> same physical page with different encryption keys, so AFAIK, there
> should be no need to flush during page state transitions, where we
> invoke these direct map interface functions for re-mapping/invalidating
> pages.
>
> I don't know if there is any other reason to flush after modifying
> the direct map ?

Isn't the Milan coherence feature (SME_COHERENT?) about the caches --
not the TLBs? And isn't the flushing being discussed here about the
TLBs?

Also, I thought that Mingwei Zhang <mizhang@google.com> found that the
Milan SEV coherence feature was basically unusable in Linux because it
only works across CPUs. It does not extend to IO (e.g., CPU caches
need to be flushed prior to free'ing a SEV VM's private address and
reallocating that location to a device driver to be used for IO). My
understanding of this feature and its limitations may be too coarse.
But I think we should be very careful about relying on this feature as
it is implemented in Milan.

That being said, I guess I could see an argument to rely on the
feature here, since we're not deallocating the memory and reallocating
it to a device. But again, I thought the feature was about cache
coherence -- not TLB coherence.
