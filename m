Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257FC1CD3A
	for <linux-coco@lists.linux.dev>; Thu,  7 Mar 2024 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794664; cv=none; b=UZKTlpUQNg5pFAU0XyP3Ld6Qn717WX75Qo4iEzeF35R0psmhHANa4rm/eAhnY71DoBRbEsGC22q4uu3vi5GdQcnSH+ZSoOFDsnqrS9bpgobyzoaCYHGDrO8r+RF6b+x37o1ZwcHR6RHGg/2GKx6c9vQXbrGXF6h3XyaX58VwX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794664; c=relaxed/simple;
	bh=x8eP0o5pZaI9jroRM2oe8B2fByfaYTMaMZG90oE3J8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T7Wa0/jvVlyG1MhMkj2ltPFhe6PgeL7tlaQo6yJ9qzMIvAh0IX5M7U4gcyzeTCZoEX4oLlGzBps01hQDw2ZlcdGz/YArAsoPfbo3gBajvs/da6CnokENNn66TPokk9aSushMNb6QrVkOHjB8frWGNdmYK7SwkgVcM5/JowAo9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=enC2nfhD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="enC2nfhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709794662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WahUM+zqL3/MV81SCT1ET9pBkiIjcOfSRMGsDbdTxr8=;
	b=enC2nfhDpLWUkV3j+F0ysC/RXXy5wIdvVKymyoH5yfP4iFwhHakXcqumnR1lJXdd6IfJuA
	u05i57IfGaV2eWK9Zl3j9LpMR5wsfcFzim+Jo7QLIHx/bRRV7/mubVMGQbxTrLdrN/JT8B
	Ux04Tfsg4PTQkxdrQVaNWPEL5Q2xGUg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-vS6f9zpkMjSLREj6xgzT5w-1; Thu, 07 Mar 2024 01:57:38 -0500
X-MC-Unique: vS6f9zpkMjSLREj6xgzT5w-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6e65140764bso505759b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 06 Mar 2024 22:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709794657; x=1710399457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WahUM+zqL3/MV81SCT1ET9pBkiIjcOfSRMGsDbdTxr8=;
        b=o403XSo79jQe1FR5DXDQByEufNw84gMoC5Ke0b15aOMSelY9zfqeDciQOsrv5EBEUP
         Almiuu5A0VxxVVuLFAifLhWaXAFJgXnrhpmeDuYDl5xBHNRKsWD8je3ZC3GNePDG7Tqx
         L1V/JEQDALFxQ09NLJ1+2NEdZpJ7kfJnk1NYgDF6UU7UGXJOxcVSpouf7+iiaLAU27ji
         lrT39oPs2ZOHveopVUqbMoa8YNloPaFcdk9OhwrmakBytqUGPy7WbLQWgKLGhg7Cv2ZA
         cJ0LvDvdGbPdt0apDJ3g7uuLpB0QDEtp+gnskzc06mRRHivMnSoeYJadjye/bPi2ezNO
         IiJw==
X-Forwarded-Encrypted: i=1; AJvYcCXt1zULdceDu8wGNN5iJsn8sYOf67WqgfWeNEXC6HY7DECwNlPZ9rWIRVGpHLcuBuipGPAkgLOEscskQ6lDg8s1ZWO2HIImC7DMMg==
X-Gm-Message-State: AOJu0Yx7kKbprbY1SS46WghNN4pU/0cyyDcttbfn2/E02RltYDLtWC/r
	jXPQd3yg0H2bZU2ARI87byEjkCRfvXnhi0NtyISlohA8tcJ8rb0n4mYlsEUCaQFqRcNO1W4t9ZO
	jrj6N0FiW3O4JcrQJ/EPTvKay7F9/Dxej3Jh9cV8m73FnRYgKPU8QKRBIaUA=
X-Received: by 2002:a05:6a00:4f8f:b0:6e6:5370:3195 with SMTP id ld15-20020a056a004f8f00b006e653703195mr3240571pfb.33.1709794657475;
        Wed, 06 Mar 2024 22:57:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE70QkKb4MS4CFQ6y/fKKac0Ls4UH2IM2U09gwVVV4yDxTwO+I27Y1R/Dw4n/JTb1WZMwcj8w==
X-Received: by 2002:a05:6a00:4f8f:b0:6e6:5370:3195 with SMTP id ld15-20020a056a004f8f00b006e653703195mr3240548pfb.33.1709794657163;
        Wed, 06 Mar 2024 22:57:37 -0800 (PST)
Received: from localhost.localdomain ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id o26-20020a056a001b5a00b006e4766d31bcsm11864528pfv.184.2024.03.06.22.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:57:36 -0800 (PST)
Date: Thu, 7 Mar 2024 14:57:27 +0800
From: Tao Liu <ltao@redhat.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv8 00/17, CORRECTED] x86/tdx: Add kexec support
Message-ID: <ZellV+unyyx6C+et@localhost.localdomain>
References: <20240227212452.3228893-1-kirill.shutemov@linux.intel.com>
 <4iospuc5oxs7vbgm3driasjeyixvgz6yrmym3kzguzngngo7zm@c6ymrw52fn5v>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4iospuc5oxs7vbgm3driasjeyixvgz6yrmym3kzguzngngo7zm@c6ymrw52fn5v>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,

On Wed, Mar 06, 2024 at 05:02:45PM +0200, Kirill A. Shutemov wrote:
> On Tue, Feb 27, 2024 at 11:24:35PM +0200, Kirill A. Shutemov wrote:
> > The patchset adds bits and pieces to get kexec (and crashkernel) work on
> > TDX guest.
> > 
> > The last patch implements CPU offlining according to the approved ACPI
> > spec change poposal[1]. It unlocks kexec with all CPUs visible in the target
> > kernel. It requires BIOS-side enabling. If it missing we fallback to booting
> > 2nd kernel with single CPU.
> > 
> > Please review. I would be glad for any feedback.
> 
> Thomas, Ingo, Borislav, Dave,
> 
> Any feedback?
> 
> Is there anything else I can do to get the patchset moving?
> 
I tested the patchset with Linux 6.8-rc6, no problem found. With the
patchset, a vmcore can be generated successfully in tdx VM and can be
analyzed by crash utility.

Tested-by: Tao Liu <ltao@redhat.com>

Thanks,
Tao Liu

> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

