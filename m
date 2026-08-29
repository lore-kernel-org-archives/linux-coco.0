Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8711A38F9;
	Sat, 29 Aug 2026 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983355; cv=none; b=KfCrwp/FX5vI7ijpgZ8xrJsdgLL5mIjNE9XC+8wOOv8xYFAfIyVf0U0ZDLZzbdadUW16enX/dr38JUCvh8WNcCpmCjdrgmhvc3KVB4jYQLhDv9wW+JM3OsPukWA7oAYOW6kdO1TPbfYGsdR+vK1jSUeTg3NaWGJeXvs582OVGNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983355; c=relaxed/simple;
	bh=MQ4pvSvjLsVP3x7VdT5CeXKSlpni/9XtijdZYznEYcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rr+L2DJFmt7ZxX0tfwDyvtzYWeqksJPJZJ6QT3l2S8iFcaRnLQnz6XFSZBQvFRkIu3SUiEA710eLkclfJXFJsxf/p2h8FuGt7LLB15tDmf2OVqBtSEN0aYtY8qVQr/42o3FBfH10NucN+uFBCIuJXth2fZ76Yqu6auuhVDd6mu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOq8adNU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOq8adNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2871F000E9;
	Sat, 29 Aug 2026 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983353;
	bh=Gmo29pYEms2+Q4Cr8/V2qBTEL01TPuCLhDnBuX4g4LY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IOq8adNUVKyS9MvFAKnNOl5jXgUJq+rvuPyYjO+aYorZpj3EN4Vw9mQDoN5dJR6+d
	 i4Xu5zDr/rJVcPD71YaZxI0DnQ+jCNa0fhBHTSlpdWBZmaFhxjWhbHrB8pPfiKltqP
	 W8IQ46DKkSKT9EDTwUK1dF2nPf+BHR0JYKzWnP5YuERGDe0Sn0kCBLupOQKP5H0Qqc
	 w8bxHP8hLouUV2LYxk5LZuAlBL6y9W04nltSwEM8KSxSmwZTnV7odvqfvIhVGSgWA2
	 yEWLz/gN6Gx100DqgoSAJV1WqxWl/Us3Y6JZcUuPP0tAQIjnfEKLPjbM3I7frZBY7g
	 rUw9Bz1HwsU8w==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
In-Reply-To: <178794567779.4159892.13554089762527571548.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-6-aneesh.kumar@kernel.org>
 <178794567779.4159892.13554089762527571548.b4-review@b4>
Date: Sat, 29 Aug 2026 11:32:23 +0530
Message-ID: <yq5ao6eltqfk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

>> The Arm CCA guest driver currently only implements TSM report support, but
>> follow-up changes will add more TSM-related functionality to the same
>> module.
>> 
>> Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
>> arm-cca-guest module. This leaves room for the module to grow additional
>> source files.
>
> That's pretty confusing, the module is called arm-cc-guest.ko but it
> has host items too?
>
> I would have more expected the module to be named arm-cca and this
> file to be guest and a future file to be host or something like that?
>
> It is annoying to change module names but we do it, and I think it
> should be no problem in this case since there are no users..
>
> But maybe this patch should be in another series..
>

We have two modules, arm-cca-guest.ko and arm-cca-host.ko, located in
their respective directories:

drivers/virt/coco/arm-cca-guest/
drivers/virt/coco/arm-cca-host/

They also have separate Kconfig symbols, ARM_CCA_GUEST and ARM_CCA_HOST.

-aneesh
