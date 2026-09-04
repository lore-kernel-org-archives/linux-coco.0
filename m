Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5647B41C;
	Fri,  4 Sep 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532053; cv=none; b=kQt+5mRh9cEDSD676TMGKLL/Z/nDS/zuslUXXni/Yi77dSmlKw2mhB8CtW8JmwqM1SVpzlVMwG5gqje9xuT5I1Z0HTxAPIpyiaqfn9Q1FoxPWdMSE+C4JHSSivaR488Und0RCooW+7JZkC+qmF7j+s7krwWhyIU6DOZ6z04T1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532053; c=relaxed/simple;
	bh=8afSVV3VII1zbi+2aHyYlVmFjAgMjMcy24VzUu8zQYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTt3VwGIX1racCLhYX/qz95yBbYwn4hIYr7QgQGvqpI6Exmxx7LmDDF/DopM0YFOMoeF9PjH3l8KHmXwvrWq3weVYTRyNRoJokvYyJF1dxrRFKjVSUGDmXUGNYbMXvSERyPTEicNk/cMkAZEDxxa+t3rgDkkwnd5Od8uCGsNMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdflBeY1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdflBeY1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4671F00A3D;
	Fri,  4 Sep 2026 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532052;
	bh=c4UqD37F/+LGYdguYZm7WUWkNiEkiZsn2JXNXp9ga54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CdflBeY1jJv/qUAGrU3S7KwA+iVY1KKJ4hPP9T7O0mj390x2owhqKHvofCMBh+wS+
	 aRUTUpORPhCXOtmyYOgxG+ARPwIudHVDH3mSE5GkhkcbctaqBPoJ45gM8M9ThDsb4M
	 nD6v4FTfJAmAFRfOosBgo5HWScHSAWmiG7q0b7SPApol1HHA8563YoCWShUMvgFK9F
	 XTYue0ff0ZTWhutCfIjGg4LmT3t4w+1E/OUGx6vxNCengvE1lC4QzlQwYRXNWjh2R4
	 2KVRko+H11GpKXXod5t+d3M0jjSx6tHaJaEC+UO1ax6bK8c5Dxx5JkShgGmre6KwyF
	 WNWJM09mtsEJQ==
Date: Fri, 4 Sep 2026 15:27:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260904-imperial-partridge-of-atheism-bafcb3@sudeepholla>
References: <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
 <20260904-keen-fiery-fulmar-702fb3@sudeepholla>
 <20260904135353.GQ4157646@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904135353.GQ4157646@nvidia.com>

On Fri, Sep 04, 2026 at 10:53:53AM -0300, Jason Gunthorpe wrote:
> On Fri, Sep 04, 2026 at 11:02:56AM +0100, Sudeep Holla wrote:
> > > It means you can never publish a version 2 that is ABI breaking
> > > because linux doesn't check for that. Was that ARM's intention with
> > > the version API? It's basically a completely pointless check that
> > > doesn't effectively do anything.
> > 
> > I didn't get that. The example above checks for minimum TRNG version,
> > so it won't break in any way for v2. What am I missing ?
> 
> If ARM sticks to what they have done in other specs, a V2 could define
> ABI that is not compatible with V1 at all. (semantic versioning and all)
>

Ah got it. I agree with you on their pattern of breaking compatibility
but things are improving, I won't say we are there yet.

> So the kernel check above will happily pass a v2 interface and then
> send garbage into the incompatible ABI.
> 

Ah that is possible, yes I can't disagree.

But I must say it is improving as the firmware teams implementing newer
versions run the existing kernel and spot the issues quickly if anything
is incompatible if the spec hadn't broken it intentionally.

> The ecosystem couldn't accept this. An ABI breaking V2 can never
> exist, so the versioning is much less useful that a normal semver
> scheme.
> 

Completely understood.

> If it was MAJOR(version) == 1 then it might make a little more sense.
> 
> I'm saying that broadly none of this version stuff seems to be doing
> much useful work. Even the more complicated RSI lower/uppper stuff was
> not good enough and they are going to follow a new scheme.
> 

Really, that's news to me.

> I think the bus is a nice idea! If you keep going down that logical
> path the next stop is to have a SMCCC that discovers the FW ABIs
> available. That would be a good moment to take a pause and try to set
> a versioning system standard that actually works consistently for the
> entire ecosystem.
> 

Yes agreed. The only argument I had is for the existing users whom we are
fitting into the SMCCC bus like TRNG. But we need some agreement on the
spec consistency if we need to do anything more smart in the core SMCCC
bus code.

> IMHO to lean into the bus design I would have a discovery SMCCC that
> returns a list of supported ABIs, something like (spec, spec version,
> ABI, FID, feature supported bitmap).  There could be overlaps if the
> FW supports several ABI incompatible versions, like RSI v1 and RSI v2.
> 

But then we will have to wait for that discovery SMCCC ABI first and that
mean how will it work on existing deployed systems ? But I like the idea.

> Then you do a driver search and the strongest match sees the bus code
> issue a "set SMCCC" that says 'I picked index #3 behave like that
> please' and then the actual SMCC driver would use a features scheme to
> further fine tune things.
> 

I don't know if I got the details right but I get the overall idea here.

> Instead of versions you have ABI's and feature bits describing what is
> supported. This is far closer to how the HW interfaces ARM designs
> tend to work, and is much more aligned to how I understand RMM is
> going.
> 

Indeed, I prefer this and get mad if new features are added without
feature bits. Version for me is just for rough indication that ideally
these features must be 0 on a version X but it shouldn't matter for
the software that purely relies on feature bits. So a big yes for that
idea and I think some specs and in some form are doing it. I can't
recall specific but I have seen it. We just need push only for that
in future specs.

> It could be consistent and layer on top of what you have now without
> ABI breaking anything.
> 

Completely agreed!

-- 
Regards,
Sudeep
