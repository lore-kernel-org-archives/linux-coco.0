Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39E37AA92
	for <linux-coco@lists.linux.dev>; Wed,  2 Sep 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361293; cv=none; b=MIHGnKVQvQDEjXi7cwAXgxXIJ3pB2qnUdMc3w5ovmAx3V2DUicLo+nTpTftd0IC0Q/bSX31yQzi4cHVfqlAlXAHrIzfDk+1PUAkMwtgt2Hd1CQ5v6pHingLiF1KUoujKba3N+7aW9Rxn/SIBRVriNGImJ3c+f55lO2AUOtRCuQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361293; c=relaxed/simple;
	bh=vyI0+5T8UYK55sjN7c+Akwn7k1qbx8c77K/++T6sd1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr9RdnWVr69HG/dlybTMXlnyGC7/RJG+y8iceUmju/68H123o/elO/CLWcfvvN6sO5vdwSUAMrNvGeQQutzvZ5Zr20R4YyFvk5MmB7MXlXGMbf1BRt+3p+DRMdgalkAdZJwtE2fnf9Row05vrDiYwnhcErplUza/GVGFf6UAzU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mUm22T8s; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mUm22T8s"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930c0f9c1b1so127731285a.1
        for <linux-coco@lists.linux.dev>; Wed, 02 Sep 2026 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788361288; x=1788966088; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=giebtW14WRSNN/oAZ2HvlFksj8A4SENo3e4Bwxaljok=;
        b=mUm22T8sw0kzR3ZLDfp84gX7Bdx2VYarjREsz5tqfnDigOONKQv2LnXxlaTPlGKMVz
         +CvVA71+qTGxv3eUnhEeRZsEtfb+rW3B1L8QlmnbIVZB1DioRu/czptV33w0zkgKwDJ7
         YS8lLierDy9Ph3EMW7vfbFbk8GkanmCDXh5IZHPX2KuzvJi7hHVJdtNA68OfDwVmGQDX
         ZPgExk4YjMVbHggaR3TJQxLeOqijXgd+jPT8LX8aTVORNXlj0awdGGJNcWq8MkDeR96E
         zzp2ucen+gYm4kcgNiXl2Y4utQ555w8el70bPRNJctxX8wcfxnKPXZDPSTh2UtzfuKUV
         gLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361288; x=1788966088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=giebtW14WRSNN/oAZ2HvlFksj8A4SENo3e4Bwxaljok=;
        b=YBoB30BCMgaIXFOcRnlJJhqWU3Zl24yMLilmGhv7faIteV7WyGDWQgMksapkSf+jkd
         a55hPyzPpZnfU6/hBCo3l1/0DEUJgc+0Uz5d8Szmjp3OTyqIPZk8Fj5Hv9DoDV4lKPdn
         ZkwYqz5XKRaU2HOAEBbnAKFLqYZx1DiK4NiCzS4dvoh3F6Qg0iTqPdzTwEBIH8NU4mt/
         fws0AUhbSOBHuue/JqLEgaUeykbAqvMib3xV64i8SC2w8Lspo5O9QEE+pv9Odygv5IDl
         nkE7pIuNmMw4bMvu/f5YCSigOwULbJnwGdzPnN+GN9VEsIiAw0Agp6gcu/d7p6SDms0Y
         kCdA==
X-Forwarded-Encrypted: i=1; AHgh+RoS0o/DHeLhzYAPYMTGnx+mjehjp/ucyuneCP5xzfILHlKieKNUVobyCo3bWMr9LOCavMkmwqPQl70W@lists.linux.dev
X-Gm-Message-State: AFuF++mpsu7r/0AWXifsDJ5/O51DXKjCzHNNLl+S8Yaa42bhQgSrICZS
	YIgsURreq3R35iYga+rMpJoguS+Jtf8UwD8lRjyN2ASSiaRg+rByxSbAnFyayk/9GlM=
X-Gm-Gg: AR+sD12P6iQpa/JCq0YeNgO3Jo4dp+JDWPKYoeYFhc4/p2G0HmgvkTahn6NZk3QFQzM
	kR7iqbnazbv3c40pWQZWpJ0hYyGlrSxsNX8l2250py1HfqGFWjg+2rWymxqLicwpmyIYx1tbcPz
	LclFhi2AfSiJdWQzUqRG5dJOFCQh2S87o2yPKk3qtH7JS5BjMVQG2+vjK6eQcDueubz+f0QcnAK
	k250s44uFB8Q1jcW6BDOSURgn+4NDN8n8LYdzZLcIsZYeDAoksCMjt/v7YMKp8slAleelT5WMMA
	0CfA/hGtfvcyM3RZivgKfeF+U8b6ALMCucjMLVFHRjw5lp9UGGXuy+TRHiuFFt7z2jZtqZbzNTI
	/5dCI1c1vKztmXQT2mB+jruXFNGcsVt7aVxCHTNpZfregHDQDJLAya/Irrq44p5z2S1oduCqyJj
	I0tYIQv9cre0ZcSQ7ocpb+sATYCSr/HB7rF5JpSV9tP7LLx1N292zQ6Ub8N6VUk1X2dmeDHC2Gf
	hPn/3T+LdH44bSAwoVwqe3qYYaQ2sGFR8ONgdES+/HqjQ==
X-Received: by 2002:a05:620a:178c:b0:937:372a:b97 with SMTP id af79cd13be357-93960dd7c34mr628429685a.17.1788361287651;
        Wed, 02 Sep 2026 08:01:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157adesm227012985a.1.2026.09.02.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:01:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1mSr-0000000EU0M-3Bwb;
	Wed, 02 Sep 2026 12:01:25 -0300
Date: Wed, 2 Sep 2026 12:01:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, ankita@nvidia.com,
	linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, Aaron Tomlin <atomlin@atomlin.com>,
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
	Will Deacon <will@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	Jiri Pirko <jiri@resnulli.us>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260902150125.GD2890729@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>

On Wed, Sep 02, 2026 at 12:20:51PM +1000, Alexey Kardashevskiy wrote:
> On 2/9/26 12:12, Xu Yilun wrote:
> > On Tue, Aug 04, 2026 at 09:55:33PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Aug 04, 2026 at 09:48:30AM +0800, Xu Yilun wrote:
> > > 
> > > > Glad to see you all here to make progress! Intel can also help on this.
> > > > Can we have a meeting to discuss on these topics? As Alexey mentioned,
> > > > previously we had a bi-weekly call, perhaps use that for our first
> > > > meeting? Or what time works best for everyone?
> > > 
> > > I prefer we defer such community discussions till September, that
> > > seems appropriate given some dates I've seen.
> > 
> > Hi Ankit & Jason,
> > 
> > Do we have a plan to schedule a meeting to discuss next steps?
> > 
> > If so, we can figure out a specific time on the Discord channel.
> > https://discord.gg/KKqC438c

> So I've been trying to find a time slot. Say, keep it on Thursdays
> (USA) (kinda short notice), bi-weekly, we can do:

I've asked several people in Europe to help on parts of this series,
and combined with China/Aus someone is going to end up left out.

I know people are anxious about their projects. In the short term I
will volunteer to send patches (ie bug fixes!) to Linus in the CC area
Dan was responsible for. Please email me if something needs some
attention and we can figure it out.

To fully move forward we need to establish a new TSM maintainer
team. In my past experience a consensus has emerged off list, I
suggest we try that here as well. Several people should be
recruited. I will also volunteer to help train and launch a new team.

I can say that several people from NVIDIA are working on the ideas in
this patch series. Ankit is setting up a team to focus on upstream
patches for all of CC inside NVIDIA. I've asked Jiri Pirko to work on
the PCI evidence uAPI based on his deep netlink experience, and Leon
Romanovsky to work on the binding problem/adversarial/trust level
driver core idea. They will share their approaches for solving these
problems as seperate proposals.

> Scenario A:
> Seattle (PDT, UTC-7)		07:00 – 08:00	Day 1
> Atlantic Time (ADT, UTC-3)	11:00 – 12:00	Day 1
> Berlin (CEST, UTC+2)		16:00 – 17:00	Day 1
> India (IST, UTC+5:30)		19:30 – 20:30	Day 1
> China (CST, UTC+8)		22:00 – 23:00	Day 1
> Sydney (AEST, UTC+10)		00:00 – 01:00	Day 2 (I can do it once in 2 weeks)

This is the only time Europe could reasonably participate in,
obviously it is not OK for China and Aus.

> Please, comment. I find these calls pretty productive syncups. So
> far we were not having Europe in these calls.

Calls are undoutably useful!

> Alternatively, wait until the LPC in a month but I suspect not
> everybody is going to be there.
 
LPC is not that far away, I think we should have a goal of having a
consensus for or at LPC

Regards,
Jason
