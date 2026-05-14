Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CD3ACA43;
	Thu, 14 May 2026 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753944; cv=none; b=QgPWNZGgcWRs2Qx0KK9lK80z0JnXIzk//RmI05RcaUemm8OdFnwYtuU6iLyMJm49En4mZAnIEolVI3GqB6omfMZNVpZzNfv8P9Z4mbsmW5KAzunbzW1SfuirKEvIIA7du6tmZW/rAA2+MEvNsu3lVHJbr/2aVIn21EYW0M8bfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753944; c=relaxed/simple;
	bh=e7xpXAWRH3bKtSRCX5MeXqyvSqXqOnDZwGaBzAXQNeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NubQvRTNj0FYwXP2fgaFKwWcnsUenYxsPltiO0a3JGQ9hYZipT3k0pdr8nYOYd4Cbh5AqVcgOEvWt/szwuooz6qRbncpfeF80GahJ13a1quh8dk0nLhqOYwLgW4wJM30P5o/3PrDdBPbW1Si0Y6e17etxX2N9EQjTbgBKtsxi+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fwk0Sggm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fwk0Sggm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06778C2BCB3;
	Thu, 14 May 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778753943;
	bh=e7xpXAWRH3bKtSRCX5MeXqyvSqXqOnDZwGaBzAXQNeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwk0SggmadWbfD2nzQQTWx7NR2HYpAvnoney57HrAoss7sdm+WwFFvMF/pSctOZcK
	 R2KyopyPnQ336M+VhYNt863kDzXcDuQ4+CS2i8lBt4DjvFyW88wg8QqD1o2asKSOru
	 dyJmTJp43CfSTv7T4PFeWIxqt68YX/ubYkoTmKlM=
Date: Thu, 14 May 2026 12:19:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device instead
 of a platform device
Message-ID: <2026051453-batting-delighted-0a57@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514094030.42495-1-aneesh.kumar@kernel.org>

On Thu, May 14, 2026 at 03:10:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
> 
> The general feedback was that a platform device should not be used when
> there is no underlying platform resource to represent. The existing CCA
> support uses a platform device solely to anchor the TSM interface in the
> device hierarchy, which is not an appropriate use of a platform device.
> Use an auxiliary device instead to track CCA support.

Why an aux device?  If this has no platform resources, please use the
faux bus support instead, that is what it is there for.  aux devices are
used when you are sharing a real resource among different "child"
drivers, and need some way to coordinate that sharing.  If you have no
resources, there's nothing to share, so no need for the complexity that
aux gives you, just use faux instead.

thanks,

greg k-h
