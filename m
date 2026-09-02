Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C90352031;
	Wed,  2 Sep 2026 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315148; cv=none; b=LH24IhtcAwip/aC2c+kwEefjTAi3c83FIk07TDO9qRTmWkO9vTGcWL/TwcYb4kfCZFxoX2Mk//y4uJK28pyu3q8lhBEyq3Y2SnCmksRCw0bzOHYeeJoOe+XXtAOx2IaEC7ZVNvNyynW4g4fk+/y+bIIVw3ky4VU/GFBYljHY6G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315148; c=relaxed/simple;
	bh=M99JmKWcrLHU0r0FrIqPbA2I/sj6H0qv2/5vaRniUQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYP8ifKtdEo89zimhk6gAYqHwqxSW9K/0xftYsCthtyah1RakW6j5qAnH6bHvlROhtvgC9EEz0rJt6g6+VOgOwLqG64C2+A/7wYbXRasTT+V17INGmbrYZTjAo+usFb73qGJMWhySKXTZXjzuZmCBgDvZGv986X6bszY75W+5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfOYIZoW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfOYIZoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788315145; x=1819851145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M99JmKWcrLHU0r0FrIqPbA2I/sj6H0qv2/5vaRniUQQ=;
  b=GfOYIZoWXt/bgw1K9hbXf6ENqELGtyq2b4QXUlc8teSk+8ZD3lJrYwRp
   xTIm33S47G6oAJA65l9avClzRUSEnnbF5qaFFEtPEvHRIfNxwc5otbxit
   9GJKHtgPFmrFDYPKwSCUwAbmtWQ2h5GINTxUn2fvGDwNTan/51TkaRYNr
   1yq1OkPd6TODzGN6N5MPCLZCl1WBz1UUSFZX1UDVUpZFDVT559mXCuZUG
   ZJ5sHrCjzHimy1M/wpxT51YVP6EdGrCQnbWvbGlSZQhg+n31pOL3RMdIs
   Z5UlWiI/2t50zTGETpu6pVD4+z9TyqIPkTWeMVCQQvaf2SdWs/1adMezk
   w==;
X-CSE-ConnectionGUID: NvWSshJHQJi6Q488XOd9Ow==
X-CSE-MsgGUID: ZHXu6Y0CRKuEW5tntGBPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="76313674"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="76313674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 19:12:22 -0700
X-CSE-ConnectionGUID: 4Xe6dTtPSSy7EjngLXTjow==
X-CSE-MsgGUID: cuOZuHybSh6IscNsR27guA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="264978348"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2026 19:12:15 -0700
Date: Wed, 2 Sep 2026 10:12:14 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, ankita@nvidia.com
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
	ankita@nvidia.com, Aaron Tomlin <atomlin@atomlin.com>,
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
	yilun.xu@linux.intel.com
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805005533.GB28508@ziepe.ca>

On Tue, Aug 04, 2026 at 09:55:33PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 04, 2026 at 09:48:30AM +0800, Xu Yilun wrote:
> 
> > Glad to see you all here to make progress! Intel can also help on this.
> > Can we have a meeting to discuss on these topics? As Alexey mentioned,
> > previously we had a bi-weekly call, perhaps use that for our first
> > meeting? Or what time works best for everyone?
> 
> I prefer we defer such community discussions till September, that
> seems appropriate given some dates I've seen.

Hi Ankit & Jason,

Do we have a plan to schedule a meeting to discuss next steps?

If so, we can figure out a specific time on the Discord channel.
https://discord.gg/KKqC438c

Thanks,
Yilun
