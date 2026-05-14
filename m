Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B2214812;
	Thu, 14 May 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762748; cv=none; b=o6OjFNC+bjpvi6d4MnxIPyzUnsU5hyXtCCMgVdpSNXO7qZcwCQRhbJfwDlgoZ4yvXCp6j7RYq755DSicXc1fGb5m/HOxSQtb6iiOZsZoY/Z+hNnLxixEMAuNTtn0An9hNfcTOiuL36g7DhPUEoRClQ6Er6CcPF2CHgf/SRc4SRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762748; c=relaxed/simple;
	bh=uzxXH31tSj4V03e2tHyrBCneawBM4/arZJhlthRiRYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+O0RxH6yQXgm9TT4zKCYc3yN/4v4h6/zpMZfrWVsaMsJsOYs2rNpSE7eapATBtm0ZOHhkRDNhqlXf2nYGqlRTxmJ6jUQpXxHvIfcbmi2ZCO9HjDe0DqhjbWv9TJHbZksbPV80hRQqjoy5jkOyItwrUF1DyAWJaDB86H1vAsmSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kq8O/dxE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kq8O/dxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA80C2BCB8;
	Thu, 14 May 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778762747;
	bh=uzxXH31tSj4V03e2tHyrBCneawBM4/arZJhlthRiRYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kq8O/dxE1+71TBvjywPOqVDLIbXE4IJFQdg8x5tDelx2tpCYRMyYlo8lumZYHjVjo
	 KjL98x8TbAqLzoIgLbIxH6ZZEZp8jsjxuGHjBY/TZ6n15Hzr1b+nrwii87ACxwb5KU
	 Vx4hjQUndhL6IjLRM9AJ0+z7cLTD1fLTuONURu5w=
Date: Thu, 14 May 2026 14:45:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <2026051428-untaxed-slacking-d029@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <2026051453-batting-delighted-0a57@gregkh>
 <yq5ase7u5kmz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ase7u5kmz.fsf@kernel.org>

On Thu, May 14, 2026 at 04:21:48PM +0530, Aneesh Kumar K.V wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, May 14, 2026 at 03:10:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> As discussed here:
> >> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
> >> 
> >> The general feedback was that a platform device should not be used when
> >> there is no underlying platform resource to represent. The existing CCA
> >> support uses a platform device solely to anchor the TSM interface in the
> >> device hierarchy, which is not an appropriate use of a platform device.
> >> Use an auxiliary device instead to track CCA support.
> >
> > Why an aux device?  If this has no platform resources, please use the
> > faux bus support instead, that is what it is there for.  aux devices are
> > used when you are sharing a real resource among different "child"
> > drivers, and need some way to coordinate that sharing.  If you have no
> > resources, there's nothing to share, so no need for the complexity that
> > aux gives you, just use faux instead.
> >
> 
> We did discuss between faux an auxiliary devices early here
> https://lore.kernel.org/all/20251010135922.GC3833649@ziepe.ca
> 
> To summarize auxiliary device was choosen so that we can do module
> autoloading.

That's not a valid reason to use the aux driver, sorry.  If you have
hardware that triggers an auto-module-load, then this is really a
hardware driver.  If it is a "virtual" driver like this, then you need
to explicitly load it on your own.  Don't abuse apis for reasons that
they are not designed for.

thanks,

greg k-h
