Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D779A930
	for <linux-coco@lists.linux.dev>; Sat,  1 Mar 2025 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740789013; cv=none; b=sB7zg9CtNMeSXY0LtLEDc98ZbDLxjzqmAPHkVbqWWc7rwtO1is8PqRet3T/lJ2TtmYn0rshfFrBvPmMbo4EmgaKS2VCcOBSvqenhGOhVMDZM0/c5/ZWs2D2eDqVTjDUE2X5uxnaYhihD7vIBtV+L8SV5uJMDmJf1WVtVGzhi1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740789013; c=relaxed/simple;
	bh=FZkF3GDM9Co50Ilt0+rIiJqCj1sUDXhtjC6soaQyIto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHvfB6fZPoTZtB/3YQktzrAwD4KRXBk8VTiiUs2k8GAANcTNyj3l2GYJfu4Inu4SzCYPz6t2Np2YJOfJ9z2BtQNilj0cdwoysij2yvcanHT2mwT6/RYNZFg97oVToDtmRIWt1j+PLUmsOhTgbjC1M//140tBDnma6heLBzekk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IemCmL8k; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IemCmL8k"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-472180fec01so27888051cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 16:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1740789011; x=1741393811; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZkF3GDM9Co50Ilt0+rIiJqCj1sUDXhtjC6soaQyIto=;
        b=IemCmL8kSBgGJEO8PW3UoZPvbQrbVVPVhOSvd0Yn+/ag5M6XaVGrN11qDs1cbkbiGm
         Oo23Dtp4pufvE92P8gSYJkQpZdwe0UQuvFCYb2kc76vQ7gPpjfKiefsEMtSIFH/j7jYs
         1DgXpVG9Yuycyb07Qx+6vmsBjaHnbOdd/Bz/hkOvSfLrKHRx23/Vq4bMyY5RjiIwogfp
         hWS2mCN5N/KESgDzmtBZJC99ZTeYg0e0vKlvTiS3sECpdQD838Lfk5PDULgD/8I11nJ2
         u62dDPWXUOkJjtM2GtUKVVK0lJoeQLmDIum+MsY5vk3kHP2E64L5AB5ujTwFzhbdcQI3
         rU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740789011; x=1741393811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZkF3GDM9Co50Ilt0+rIiJqCj1sUDXhtjC6soaQyIto=;
        b=R907dgCS593aanzVI94lPCEs8RhW6cFj78UhpHT57dqXwdLg03yp90RfMCsBdLjFVo
         3mh/wVyiC7pkO/QjaagEoJ3zXbLixvRoN1QpL3k9BXZ06aM4v9v2lWTn7Lfspxyrg1Sq
         ffJJw9IsaFPX3p4GkyHcSJdWt6H0Z3FkQGEfFpBLYki6R/6Ww6OLaetApNtlgpSUOq7b
         l0V9dGfqLsk8kTb4S8UTwYxPKBQG2YD3aEzvOWOAC3v9dnJ/6czu3r6kuAdYsIbFP8eg
         McZzutaRunZ9JXv9T2KQH0+fVkb+eC6+suICkZxGz6Q3xLOiHASN6TyaqaHN1zK7VwOH
         Js4g==
X-Forwarded-Encrypted: i=1; AJvYcCXuI19kZ8VmSsejIN9+4Nz9W70oqjSy8S4+rr4dYyTTu8s0yvvpxOicGsNHdY2dMxNJk1AJzPjhtUbW@lists.linux.dev
X-Gm-Message-State: AOJu0YwKslMkMso9aCczt6jjWlfeViSH/NyHXZZ/DH0aisAUQipMnOAF
	7TxK7/fn2+RZdQCN3B93yzYCZuHyNHIDyXPuDMVX40UrYGMlcct7Vum00P8zjDM=
X-Gm-Gg: ASbGnctvIe9NuBmGqJAoS0V2xQRX61h7pEH4nFqFQOjaVdfrBzC/D/XGE/vN4KOtRVE
	7nhE18PQEL/uZ+0gT1afYRrNacceKnFGvlwycRudGtfcmxl5liUoKMpWoRj5p67FnajcQDP3DpA
	O7LJ6PzxL1zbo3Hor0+0Y21DUN1jR1JW4gvq/yn4WsNFd5rRESiRxH/pK9uMiNTElCchG6ZaM66
	Bkqzp3wwim7IhoL2CtNnNQ1pH6P87SxylG08eGDWLtKvIIVn0Utuj81WXssp0pRX6fbByJqbEYQ
	TJngSaTs4gBdU5Bdd2l0vWAFFCD51kl0mDSe4G8FeFrSMoMAAdc83O1IlehNNs9DrAFPsMuqnqf
	ZXG6g/31dbAzru4tOqQ==
X-Google-Smtp-Source: AGHT+IGoKXhCq1vdLsUCIzF4lunmHcwYw+D3mRuNmPD/25PERj7Y5vHDBX7k1/qClqDvWD+UHansAA==
X-Received: by 2002:ac8:570b:0:b0:471:ef27:a30a with SMTP id d75a77b69052e-474bc08cb95mr87868941cf.28.1740789011339;
        Fri, 28 Feb 2025 16:30:11 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474721bf857sm30749961cf.38.2025.02.28.16.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 16:30:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1toAk5-00000000VNV-3jdd;
	Fri, 28 Feb 2025 20:30:09 -0400
Date: Fri, 28 Feb 2025 20:30:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 0/6] Enlightened vTPM support for SVSM on SEV-SNP
Message-ID: <20250301003009.GP5011@ziepe.ca>
References: <20250228170720.144739-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228170720.144739-1-sgarzare@redhat.com>

On Fri, Feb 28, 2025 at 06:07:14PM +0100, Stefano Garzarella wrote:
> I put RFC back in because we haven't yet decided if this is the best
> approach to support SVSM vTPM, but I really like to receive feedbacks
> especially from the maintainer/reviewers of the TPM subsystem, to see if
> this approach is acceptable.

I didn't look in high detail, but the overall shape is what I was
thinking about in our previous conversations. Very little TPM code is
under arch/, we have a nice simplifying helper in the core code, and
you have a tidy platform device to tie it all together.

Jason
