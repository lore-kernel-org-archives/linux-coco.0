Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1F1374D2
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 23:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="37zCXY4v"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53eeb28e8e5so2600a12.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 16:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697498308; x=1698103108; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iC/11YtDunCM076LJgjQ2zeYYGBdalGng9NijQt/KpE=;
        b=37zCXY4vxqX95ghXnzqOe4aJaTl25ze98P8NjOhoJA60EEvkHSqFuCLsvqHkajQWIZ
         SGAkIiQIfMPL8ZyD0vDNUD+2NqJl1RhaMJJhmtvVOxjHHugP0VkdV0c/74jQEZpn0gvl
         20/ihFmxRah1Us7MsXKvfM3pMOI2nh+e2tizA4NyugxBmzUeEi3Hj0JGn9dbzLnrg3T6
         vXTuyn+CDeIrcV0tBtXAzghEy3LymF6kWqLB3fmZKVXLNQjAr+IPBKWKUJxlzkOGXDkO
         tYWUpwKMNxgHVeO2NljxdbxCISDxylmau2sjBAB++NXe1lGlJ7nXtRCHFbO5g+5q4Qs9
         bt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697498308; x=1698103108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC/11YtDunCM076LJgjQ2zeYYGBdalGng9NijQt/KpE=;
        b=YfmIzJoQDwLHdCx6apU+usfGN3z6YA0KK+2KDESKX/83GuTXcY8xahcaGR3kzO+j9s
         QZhmimQEd00/Tt1suOOi7uZTWwc0ha8uptTCp9XVAI4FNTSSPrUXTjc06+p8qWHl3P1z
         WiKgQQHjGuT5HdxLgW5dZZgXH9gPA5t+6Pkrk4sfzYspkesJ6yf7XaRPwu6zpQ4ojiOu
         eSpNn1PitXujNvUIWIoPxmwVDDOVZKBfCJZwL9abAowJM/DO1898FORkOi7pvOmFmc26
         uTJbLHOhtYt4boFe0pQFFWYjYhGVXK8p120YAnidpXL1MU1y1gbFLzUCBQSWeadGOi2t
         +e2Q==
X-Gm-Message-State: AOJu0YyjVdZx8Wn/2cUdzgqtCMwKlO7+++ghatyk8XmXP+bIkUfe27Xn
	OMM4lOA07/rGSbqPh6M3bMBvzTnzeaZ5W6Nj/peiYg==
X-Google-Smtp-Source: AGHT+IHSDQVFWveLXyGf0tUPijXYrSYM2YYlGt8C3Vmqr3FgJBMJpfYl60pFDrziom8VotGlWJVPTuF/S05fQjy7/O0=
X-Received: by 2002:a50:8ad6:0:b0:522:4741:d992 with SMTP id
 k22-20020a508ad6000000b005224741d992mr50659edk.4.1697498308135; Mon, 16 Oct
 2023 16:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com> <20231016132819.1002933-49-michael.roth@amd.com>
In-Reply-To: <20231016132819.1002933-49-michael.roth@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 16 Oct 2023 16:18:16 -0700
Message-ID: <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>, 
	Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="UTF-8"

> +
> +       /*
> +        * If a VMM-specific certificate blob hasn't been provided, grab the
> +        * host-wide one.
> +        */
> +       snp_certs = sev_snp_certs_get(sev->snp_certs);
> +       if (!snp_certs)
> +               snp_certs = sev_snp_global_certs_get();
> +

This is where the generation I suggested adding would get checked. If
the instance certs' generation is not the global generation, then I
think we need a way to return to the VMM to make that right before
continuing to provide outdated certificates.
This might be an unreasonable request, but the fact that the certs and
reported_tcb can be set while a VM is running makes this an issue.

-- 
-Dionna Glaze, PhD (she/her)
