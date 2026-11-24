Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488525;
	b=U2VTbmG9p7eyHNGvAhxmrf03awjFV2vo7jRNpFkIu1OyZN892npNSxcuvEkpjmJHZ2R4
	 MK3PxacDcigtdrefMDqY/McL0R5Shi8vtfU0qbxVgjErow8oFUfHJQBxzx8PR0s3XgKpS
	 ZJHN1v6Z+4yxkldZopdqqhnsR4G7pcy7eb/giNScmkY40hBVi/E4fVvxiNH0JOk2S9Mbg
	 3zkiVGwYgEAb4xxUIbE03C+u+nTJrth15nJ/FTJmAR3nUvFVhgyS2ITypMaRHi0w+sjGA
	 zkHJ22ImEbD0oPBc/a5i1H3O2pMu7dT0RvFaLeP2Uyf4kqs4qNEzsWqZIa6ItGExRwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=feBMC46Kg9xglm0UM1RjR22Aujb6Qvmmma1ih7AmJ8A=;
	b=KCPUBCYo4l8GU/D48H25SuWPWczRCukk9eP0WftFhuUQy8n9a4LxWAfun//KNPiYW3dN
	 kpsscv0vm9c8g5xRSw8U6y8RHqN6d2I8R5NNrs7BlKSjFEDM8bVSin3LVxSeTYLM+zQjU
	 +rE9qCVw893y0dvWJ0GGYQCEr2JpMqdRCP5knGllNA6tp8cKyfWyuleJEqGW+3wycbu7u
	 enb8iLxeo1l3kfbDth1nyzRAHu7zT3tblyNvdpKOnzXG8U3AEpM/A/lILRt1RBW3kvYrs
	 mc9gumfjMeNhMB/XF7Iz/cP9Yq64+1zF/nToGdVnAdTiChqUc9EaI6W15s7mpT2epUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RtNA4YSv;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70FF606A322
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 02:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70FF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RtNA4YSv
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-92116a3ef3cso57755146d6.0
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 18:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795488524; x=1796093324; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=feBMC46Kg9xglm0UM1RjR22Aujb6Qvmmma1ih7AmJ8A=;
        b=RtNA4YSvLFMZ5lnSiZh1m1NlL+D+riCXGTcQdepviTMC3WSnMRhYxcLrqMYSyFcISA
         lc5MWZXgRQcIAsAbDjrgEqTk7DeXyYZZkiOm8X/uCU3eZtVKJK44Zom4T03iQ1AsVoyT
         Ysblwh8C/dugkHM2f0c7Fh0Epz+5BFxRCOOgTwFZc9cS5mbyKjmom07PZOt+nOjlfznH
         MFUlvndIDvQCLlNAIid00vWeHyvV3nrPiutokTEH9blml+TO3aC9SOSR2z5WXqsHP1Wu
         Ogmu+Tq4grBPADLinR+htLAeN+MAHIra8jOwTHLVZ0KugquZv+w+xIOtHSdODzTRKb/H
         d7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488524; x=1796093324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feBMC46Kg9xglm0UM1RjR22Aujb6Qvmmma1ih7AmJ8A=;
        b=ZWeQMwkhmH0F1wH2ivsHSKxbHSlvXwYePc7tT2Xhy3GfCS9qwB303VpONtCZKURqZ/
         AbAxKkBY7YipV0R4foYd74Tg2EraCLyBQtvyH7dndTpxAVYk/0SpTkMdF8ddVWrvQpco
         +0roEn8jh40y8cygRcv3CZV+GbbO1n8qIxviP4fPPpa8Ay44Rz1Kcja7W5u9/qhXldA6
         Iy1zMmIHg14oO5IT7d0keTiCnD1gFj8iL9cUe+IkXwecPsa9LNV+XjP2R/vg0MgNyCL6
         fOOizS0Ql9nnOtK3rMcZK1McVqNwSMRldUf0UA2ceFzLyac7nWcK0X7ue1q3aVO1681G
         NDvA==
X-Forwarded-Encrypted: i=1; AL+hErGLHIg98tfOrdwjMijaEYpfId5MS4yK+vXbK260eo42/iNSBpOIUbOzG54IOhue8FV/h2R1S8zG0uMk@lists.linux.dev
X-Gm-Message-State: APuU4Z/WFj5fQHus/JugBHQ7xe5QKsx5xR/zgyv/pyE1YDKTqjFW0PC8
	9QEQHX5IOl3aeWT/Xl3B4yVhAU+mBnu7Etn091b1cJ0PgvNfmZVWtLLL0PkpxiSq9Z4=
X-Gm-Gg: AZFdTZfYgv9h1vMZtfT8f72T/mVkj6M7QEGfxQpEVLWGJGOV3W4Zkam1P6B6+FMSoDm
	ha/AcDzXsmx5iucTom5N9WUlFy2L6dgKWfOa7Rdd2ccv6qHJ1kvbE5AGyLeSdiquWE2UlMoH5W4
	gX6znegt+CCQURXlmlLur0LnOSKCVS04GlynvVn8TC8VWMUTCIV2ZmYKfwmzDJSFHFbofkWjfTg
	pYRznNdeqvKFv0HTj8ZENW/ibsPSRXvdMB/hE9fecmQCCIB/fXSDqqt+q4nRzcuWzzb9t8KA2kh
	SsjlUl5OvmCWZVbHPbVOLghCHOnNz7IKOw51nfwvyFOAhIxkmtNK/n0LodBtwzN5ufd0lX4is1p
	JWKCMYXO8BZakHYb1QfLVNNGZ2xjQwCvxOm6SEaLN4gdVYWnNq8WdleRx7PsfdELkgzG9FACNQZ
	X7M9YVOrEI87RkQ/1u8Kiq+iSRUIUlMe6mK0K5sG8rn42LiX2rGpFlVA+hLVzZfFj3b5RsD/B1O
	DSlGASJJuvJT0wfWOkydS/zZNAK47jZ+zzmyuaqydzXqF419GMB3YgezM87LNNzmQnT13Eo/uzO
	N4w51WU=
X-Received: by 2002:a05:6214:2263:b0:921:37ed:5c6 with SMTP id 6a1803df08f44-92137ed06efmr217313286d6.22.1795488523691;
        Mon, 23 Nov 2026 18:48:43 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d14d1sm122581686d6.18.2026.11.23.18.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:48:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVgaI-000000002sY-302b;
	Mon, 23 Nov 2026 22:48:42 -0400
Date: Mon, 23 Nov 2026 22:48:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 01/10] PCI/TSM: Report active IDE streams per host
 bridge
Message-ID: <20261124024842.GB9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-2-aneesh.kumar@kernel.org>
 <f377271d-353f-4c8e-94d5-98159a66ab28@amd.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f377271d-353f-4c8e-94d5-98159a66ab28@amd.com>

On Tue, Nov 24, 2026 at 11:11:49AM +1100, Alexey Kardashevskiy wrote:
> On 23/11/26 19:33, Aneesh Kumar K.V (Arm) wrote:
> > From: Dan Williams <dan.j.williams@intel.com>
> > 
> > The first attempt at an ABI for this failed to account for naming
> > collisions across host bridges:
> > 
> > Commit a4438f06b1db ("PCI/TSM: Report active IDE streams")
> > 
> > Revive this ABI with a per host bridge link that appears at first stream
> > creation for a given host bridge and disappears after the last stream is
> > removed.
> > 
> > For systems with many host bridge objects it allows:
> > 
> >      ls /sys/class/tsm/tsmN/pci*/stream*
> > 
> > ...to find all the host bridges with active streams without first iterating
> > over all host bridges. Yilun notes that is handy to have this short cut [1]
> > and from an administrator perspective it helps with inventory for
> > constrained stream resources.
> > 
> > Link: http://lore.kernel.org/aXLtILY85oMU5qlb@yilunxu-OptiPlex-7050 [1]
> > Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > ---
> >   Documentation/ABI/testing/sysfs-class-tsm | 13 ++++
> >   drivers/pci/ide.c                         |  4 +
> >   drivers/virt/coco/tsm-core.c              | 95 +++++++++++++++++++++++
> 
> I'll take to the tsm tree, thanks!

Lets not take any new sysfs APIs please. These all need a careful
thing and we are not having a good history right now on any of these.

I'm not even sure what this is supposed to be for, is it debugging?

Jason
