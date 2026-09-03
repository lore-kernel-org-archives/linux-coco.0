Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2444CF22
	for <linux-coco@lists.linux.dev>; Thu,  3 Sep 2026 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458017; cv=none; b=LCe004cRIuWK1DT0Od97KZKuXQG+NEMNPjumRTQK93i64Bbz/jUvu04AwI1vB6mLx4SqjTJ2TZ0YhSCRUItjax9Eajpe17ihCviko8ZpUkr1CCBgHTQSUokQ3vk6fv0/bypNhfvpjrsaPBelbdW1B7xJRM5kGYXHJCmhI9i52uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458017; c=relaxed/simple;
	bh=DzQDxkkXEH2+Mp8OUsaYNxAH3LbRjRgBZk7gary7lQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgF7NghFL1ftPJvwsk9HhVTHssjd+Polu2hScmq3bMdnNLgPbEn7Z+oM0FG1ehx0d6TWLqSf81AtxtUlzcToneWyHZVI9yrf6rgnTXs/qQ9dRNSJRPrOcUGVE3RaC623U5krMzQqgnydZ0WmUOqTURt4tHAvnLQQ3M8Nxi5JepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mHN2U3G7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mHN2U3G7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530420edf1bso3176611cf.1
        for <linux-coco@lists.linux.dev>; Thu, 03 Sep 2026 10:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788458015; x=1789062815; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d4rOxY3h7ZQvpkIblsAFRKEuph26UmxGEHCOpw1rXj8=;
        b=mHN2U3G7f51HI4mdxmW9ZGbDhO4YtDIljvyzwcCkbOjObph6tlcJnR8i8fTlnrChku
         7fGGpQiEqYHotIb4IKMsgHq60EFMaehFmiyME/qvZiX/RMYmeFUvIZheImfvC5hsaYwL
         QHhKX+di+Lw/6298sCnZhgHihRQ4S1NxFQUYYOZ8vdZ3/EpAIFtrGWqgqVyF99KY6SbU
         Y8Ut3XGgXyAV4uxs0xIS0xnmZMZnzdbydMOZf8dqO8OElOScQra7mbk/i8RmHK/MpgMT
         QBzQyioeErna9kGtpUV7J5WAeAmGYQUQx1aHVB/fTdIQgp2Osb0j3lAWfUwABhAGGdoe
         81lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458015; x=1789062815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4rOxY3h7ZQvpkIblsAFRKEuph26UmxGEHCOpw1rXj8=;
        b=rlIGWTqdWNTuGaZjKXi2TiuHPvEf6bmKHD4YQws3k/qD0eTQG8rjmtZ5MI7BcDqlpM
         gESNzui4BqlN2x1Py/FeoUbFcnsNUb0Qhhsimmm84AUHqiRuvwUX+QBjlgSYJWaT/O0O
         hogG5WuEFL6cdtdL9428MPlaUGPuRXZNdVfdoO4vVP2CXGql3WHma97++Hri4ltMaKZ5
         QMk3aUkQ5ProY+DqMVVKweuZJOmfMXNfiuNBLeQaq5gsy7a5EiPSj9BrlRN/dEYeV2VR
         xgfisSxtzlW3XPzcDGZaWmTVmVm+00H2aTCjCkfuXFB19GDruFPYcKZ6OwZZZy4zmijs
         S2oA==
X-Forwarded-Encrypted: i=1; AKwUvBww8SrxAJTqBqK6CG7N3TxjkpN/g06ki7PanIERfsf0FjA+2OwwJYpi7Veu/Jzla3wOjJ0GJ8QGzQZf@lists.linux.dev
X-Gm-Message-State: AFuF++l99CrXMcAowDTX7uLrJqKiHJnGKxC8ZX83a8r+h8jYdX02Fc7I
	GelpS3lWndfxm+6OBKdGRcAATo5ZZuno4SeSyiDXfyhbeBQP0w3N0AfL3MdMARgxCjI=
X-Gm-Gg: AYBFou2sV0blgkAaLeBL80kQiseOxhJq7pqMQ3im9m3yRQG88kaCPVGoUM3t7KRGxSr
	iuMLBjEWrmbD79nI+xGeNkJFLUuIYq+qrxxk7Hh79x0UtpRlHoA4Vmq5RTukK8Alzx552waaKtE
	daLen2Y1KepD8IkFFEqyK5/BmbPXcZ7e7oHvpMo7kfwqTvMXgiTuJq15Ize7DI6mlixWEyYRsaV
	SGxOGwA9neoR6MV2SNxiEO+t+vr78vHR58TYaS0bFvUhuoYbM4jtQOHQTT8J3vHkhAa15bzJkFw
	Ra0W3UEIEcITgtGLqO39y4TL0KRP8mMwcMCptBwHrQatmYG/EEWFKATejuPe9zVwp5Jad6ZCAmU
	UkIIQ/EWlEtFGb7T0Tcg2lERpTplAGc7NGzVo7nJwYYVU4Zd7bCDBgJaYD9likMCLLR8zWhiPm/
	y0Nv9pmCM7KjfPHsevuvyPmLZRV5RGO06+Ey18aJ+BTl9tW0/m6aa+shxkhJs3AQ+VNtIMjkAuJ
	AzqY9ByAzHiBhx11zwbvTf3o5Raaop7wO1vaRyBK6Lv9T6pI7s9QBls
X-Received: by 2002:a05:622a:1389:b0:52d:ea18:a8f with SMTP id d75a77b69052e-530548e2cc0mr6156201cf.29.1788458014775;
        Thu, 03 Sep 2026 10:53:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9103f22afbbsm1823116d6.8.2026.09.03.10.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:53:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x2Bcy-000000001zX-35Hi;
	Thu, 03 Sep 2026 14:53:32 -0300
Date: Thu, 3 Sep 2026 14:53:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lukas Wunner <lukas@wunner.de>
Cc: Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	ankita@nvidia.com, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
	Aaron Tomlin <atomlin@atomlin.com>,
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
	Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	rick.p.edgecombe@intel.com, yilun.xu@intel.com,
	Jiri Pirko <jiri@resnulli.us>, Leon Romanovsky <leon@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260903175332.GN2890729@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
 <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050>
 <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <20260902150125.GD2890729@ziepe.ca>
 <apl39vOiMPP7VloW@wunner.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apl39vOiMPP7VloW@wunner.de>

On Thu, Sep 03, 2026 at 03:36:54PM +0200, Lukas Wunner wrote:
> Dan was added as third devsec maintainer to host tsm.git:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/
> 
> Jonathan and I retain access to both repositories.

Fortunately they are on kernel.org so Konstantin can always recover
anything, we can get to that when there is a community consensus on
the new team.

In the short term Linus doesn't care so much about where the tree
comes from. Personally I'd rather leave that as is until the new team
is ready to put work into it. It looks like there a number of things
that may need preservation..

> > This is the only time Europe could reasonably participate in,
> > obviously it is not OK for China and Aus.
> 
> FWIW, I'm likewise based in Europe, as is Jonathan.

I was wondering if we should try to have two calls on opposite
sides.

> Obviously, one cannot separate discussing Dan's work from Dan.

Yes, please lets all have patience and understanding

Personally I feel seeing the overall work finished and products using
it in the market will be a "in memorandum" dedication for Dan.

Jason
