Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAA3B995B;
	Thu, 14 May 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755917; cv=none; b=hAaAP3smv77uc9uFFoyVRw+LSxSvhDmjulOhyzXTpNraUPV1BXnBUMEVFGh9FJgHFVlq0zqzFcdbzV6boj9uhb7lV1YNLro78lytt66bgYaiGhj/JPKvuzMYyaLjM73YXXJAvdxRTpcuFnMVum7uwfS18mzvui4/ZFJjHwfA8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755917; c=relaxed/simple;
	bh=NdIUfducvTRfNv9EYak+8ec9D63cIOd0Q93R/5kYsIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N6d2bfTUdiZ7dUtyPp3/PnnwseEx+psZvwSA1faVja7mlmRYEbd0q0kdeEu80cj2GaQZxZaVVyyCLqOLMH9e9MtKMCNCksxRPIjk2JiJ55vUZ0pgxUFjYAM9Mop6rHD18vfmsNFNpy+Pet+oisZsgC+y+tkRaxreYd/P2TuZZnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZGxBDkP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZGxBDkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114D4C2BCB3;
	Thu, 14 May 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755916;
	bh=NdIUfducvTRfNv9EYak+8ec9D63cIOd0Q93R/5kYsIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TZGxBDkPMRNBmNhF9URVkpubYH9ZVQym8A3/b6mCW61gCl35FjejmAg5Nkv6Wbesg
	 9cmY4U7pCPnrbZL00Z12bH+ewTJb9/cFganuk7XvB1fUWu8rHs8QiOhEPwJ/S3sD1J
	 EtxFChOpUSfwkLSY+Wr+A9eIYPR4APzdb80ivSay/AYG4yQQQIeQWFvC/8rm3p04J6
	 u5nVcJhSq0yaTi/3eVimpctCx3HHKDKC8A7us5rTjB76ZWOwuwwMfhFsWkaiHM2cFI
	 /nL/XRo2kj6Ujd6NTPE+y4smsYdL5sRaZqCA9yG2i0baQjIe3lXqw52KSR9DUQr5VI
	 Sg2yPIUvbctJg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device
 instead of a platform device
In-Reply-To: <2026051453-batting-delighted-0a57@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <2026051453-batting-delighted-0a57@gregkh>
Date: Thu, 14 May 2026 16:21:48 +0530
Message-ID: <yq5ase7u5kmz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, May 14, 2026 at 03:10:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> As discussed here:
>> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
>> 
>> The general feedback was that a platform device should not be used when
>> there is no underlying platform resource to represent. The existing CCA
>> support uses a platform device solely to anchor the TSM interface in the
>> device hierarchy, which is not an appropriate use of a platform device.
>> Use an auxiliary device instead to track CCA support.
>
> Why an aux device?  If this has no platform resources, please use the
> faux bus support instead, that is what it is there for.  aux devices are
> used when you are sharing a real resource among different "child"
> drivers, and need some way to coordinate that sharing.  If you have no
> resources, there's nothing to share, so no need for the complexity that
> aux gives you, just use faux instead.
>

We did discuss between faux an auxiliary devices early here
https://lore.kernel.org/all/20251010135922.GC3833649@ziepe.ca

To summarize auxiliary device was choosen so that we can do module
autoloading.

-aneesh
