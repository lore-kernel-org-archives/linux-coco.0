Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAF93191D3
	for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281378; cv=none; b=fAPjatbdWQ2f3oe2NhxfHmVX6lijtB0HcpO3q2W69ui0UMhpUuWmlByPyRYEOt5SBg5j8M9/1FvVkMh55A5QE7WHYrmDnhDLyiYuS8f5Kah1KxZ6LPPHjrpCh1gHfiOCFWlUrl2PYwMOPf8YxWiB4kdcMfuRyOS2M2VQ4fTSuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281378; c=relaxed/simple;
	bh=lMzH1GE+iKbOtPjkrcpk63ibuXDoMGMXvQt/koZqnqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbIemq3r3vnJNStlKl3t1euxnB61eFIqwSrKMkH+KwKMYxX6ig7Sw748u/LBhA0y9isMi5/v3xdfExspn1SJaDraNAo84sbORN07NARDea9YN1OyrJu/IlAi4QQ4EenQ0Ajdlt97CLuOfVeqZBWe+1Cwq65XSAtPfoDBZjFrKrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=osnYpXxa; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="osnYpXxa"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38f620399a0so264150a91.2
        for <linux-coco@lists.linux.dev>; Tue, 28 Jul 2026 16:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785281377; x=1785886177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TcnuxxaLXXCjqu1rDtFOdNvCOQDXn343+yTz8KiZZQE=;
        b=osnYpXxacsob18FKPCPRYXY6nG/uxAVkHc0ElNRYRAtD7vh8lSz0cr2q1PuB0QWTbI
         p53Fo3vtU/h1ggKYxOA8RwiSM5J639eIlEKq2d1x19AbI3tv/kwq1EEnGs/AX49Ltkdz
         8BPwSEumnecj8PjXofMna+E4dW1MVj9idlx2497SuM+gE0ioQ16cZYZglWOUxe2O1wU7
         01dcyXQWiUuasoZ9PGF7+MFR2PRah060OkKvnPASk1KRVCJYqEFvKoLUtgwsmJuiFoYb
         6AuHk1jHAGIkq4lAGGDLFn/GzowWNke4NBtxctip0JlFYZ2M3upQuAa2yzt/yRglN33f
         bOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785281377; x=1785886177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcnuxxaLXXCjqu1rDtFOdNvCOQDXn343+yTz8KiZZQE=;
        b=m90P923F9tV9cAemG3NFFKmFAW+lCvMsx9+dbOgEiOgrK2hmZz6Euw8N0diBQtFnQt
         tHvLxVQtMpsPy/VG3ncT9LNrzi3pgD8aodedWGd92deRqr0ZyRTSesceSL80WTesBKq0
         yTkDjA6JYQ5HQOpbSkEBbCP2R2EGpYhtaCz2iEz6XcAurb+jvmtM+p4qSb9hD4a3qqwT
         5UYfFcretKdH6g7DPG3ECyQvNw3Kb676PFX9oPEFG9biZD5OUjMl07LlIU2JcB9/OpTQ
         ZKZk2lhy50u+kyymQxTDrUc2W2+AQBMQMuTa/3H4Y9fKSaDb9Hs1vazPpXnzGTfX6Kb4
         qK+w==
X-Gm-Message-State: AOJu0Ywus5GwC3/OA1fTKlV3KxR1i83vew93hvFJPcjzUef6XuE36Cig
	9RPHXltTAbINtuyzMVEc2Exhdcj4GFVUJzkKh7idjlX4nvUTox3cn5Xn29m4hdYwhPo=
X-Gm-Gg: AR+sD10hcDQHIfa3owJS8wm9wbpEOyyo1yaiHNXbA8T0dGpY03agF+xOxFGSG4yf8hQ
	x0wFrGTXa66G8j+jgJ5zxLgl5o29Gm+26/40zdB6rcVogJoYmaMPv1sqefSSBYsfDsGwH+LBiAI
	kUBkZBO8xo/uU5AU+7qI/8lr6pr1E8pRYBvdXStUmEKzOl9PYSOerVe8OU+8Tg4RdneLl58ou+k
	DXRw60EfymGfAz5P2OUgb1nLf0vdQievKYzjT3R2r3/S/XRnChrC3NfTdIMuoPiipA8K2Ems1En
	roQAD7DLGSW8+qmRa9MU1uRS1iG9rrULaKhOrh8zS9/IXRH2vJiNfbqUxGgFcO+GncA2mkfa9Au
	pdS50044OdaIs1ngciiVe5f0LrWfKon5x/b4GUx2h+Yuq2YUThi9adAMX9nDjTNuxRzUCxvNCPZ
	ZhMz7dzaURVwbwcttb6fCzbRSk6B+RSrYIU7UMwQFuYAZgPaNlN8Umdo8vt27CYW0g
X-Received: by 2002:a17:90b:3c91:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-38f6a37c1afmr4515935a91.12.1785281376718;
        Tue, 28 Jul 2026 16:29:36 -0700 (PDT)
Received: from ziepe.ca (d50-92-54-205.bchsia.telus.net. [50.92.54.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f814e523dsm112041a91.2.2026.07.28.16.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 16:29:36 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1worEt-0001oO-LX;
	Tue, 28 Jul 2026 20:29:35 -0300
Date: Tue, 28 Jul 2026 20:29:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, ankita@nvidia.com,
	Aaron Tomlin <atomlin@atomlin.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <amk7Xzm5jmz+6SPJ@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>

On Tue, Jul 28, 2026 at 06:20:10PM +1000, Alexey Kardashevskiy wrote:
> On 6/7/26 08:08, Dan Williams wrote:
> > Major changes since: "[PATCH v2 00/19] PCI/TSM: TEE I/O infrastructure" [1]
> 
> soo with the recent sudden sad news about Dan, I do not know where to start really so I just start...
> 
> Here is his unfinished work which I'd really like to see finished to
> progress with the phase2 of the plan. How do we proceed from now on?

Yes, we do, but at least I need some more time before considering what
to do, sorry.

> The direction appears to be set, imho the immediate TODO list is:
> - address "not-netlink-y enough" concerns
> - teach pci_iomap() to map mixed private+shared BARs (ones which contain MSIX for the starter)
> - always call pci_tsm_ops::enable_dma/disable_dma
> - ditch the module trust parameter?
> - add a knob to enable/disable DMA and keep TDI in RUN

I somehow suspect we should probably reduce the scope somewhat into
smaller chunks at a time and try to follow this as a skeleton, but I
haven't studied it carefully.

Jason
