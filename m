Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653D4BAA0B;
	Thu,  3 Sep 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446154; cv=none; b=MzJqi/CFcg15UOBdTgCRcD2Oou1v/QAV7XLuqU8qLoi0xI85h0B0qib2+0QeA6mNoESsZglpr/zoud8M+N7adZGfrUScXx3O/I86Dt1YKxYapMRfAYryaIk2uGvhEuLEVK9NM9WH6tTjHbP6oNJVP2TtD8QdWR4y1K6XEt1HBTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446154; c=relaxed/simple;
	bh=bu+pyXFj7sNLmakQmL0jFnSTt/DRNrTkdOpW8RUv1Ys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ENk78Khg85oKzqFxuXJYkwtXBJCLZXy5p0Kluo3ntakSq6U3J+2H1/wgKy3OsoD3c8JJTeO9qETY/+zwdNtuGJ7lUI01B7CAXWMMwJ88JJ71yWHVe0knMzafb0opZdnHQv0uUl6dQNw6fHwiMSzN2kXUYaAdwSnNixdUuf1dnkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzXaRsxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzXaRsxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B00C1F00A3D;
	Thu,  3 Sep 2026 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788446150;
	bh=bu+pyXFj7sNLmakQmL0jFnSTt/DRNrTkdOpW8RUv1Ys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZzXaRsxNnutDszNFcLFo1SYHliTv2hHPvo2KXqgu5dKjaPABNmpg4eUO+vELocjZE
	 3/2cfr47oG1DjtzLx7pilksYA1O+oxr6Mzyz/9s0wQr4aIJzEGqrKGGK/Krr6Jfd4q
	 04B7hNHnugDlgfH4mamFmBRLWllA4dGEHx2RrD4NSjU5R6xxte+NIQko85dCz0q/r8
	 /5Vr1NgdkxFLWcarrhcsTiSrsq9TiOBSmm98de7onNi7NjLX7rk3i3AFkNfaK1gNxl
	 WVBSPtWUcDVftZBwBC8t87KVU7lLfw2TBv8GVDD/sIJSyTv9Wj3N3jdSoxfx+KsUEi
	 W48TYRvVy53Pg==
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
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <20260903125718.GI4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org> <20260903125718.GI4157646@nvidia.com>
Date: Thu, 03 Sep 2026 20:05:40 +0530
Message-ID: <yq5av78mxv0j.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
>
>> I have updated the bus to match devices using func_id.
>
> Did you have any thoughts on how to handle ARM's versioning scheme
> too?
>
> I'm not sure what the rules are but it seems like if the major changes
> then the API is incompatible? So shouldn't every driver advertise a
> supported major, and the major be in the modalias and checked by match
> too?

I expect a single driver to handle the RSI features and determine the
version range it supports. I don't think we want multiple drivers, each
handling a different major version of the RMM release. Given that,
wouldn't it be sufficient for the driver's probe routine to check the
supported version range and return -ENODEV if it is unsupported?

-aneesh
