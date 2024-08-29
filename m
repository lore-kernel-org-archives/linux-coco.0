Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD0119408B
	for <linux-coco@lists.linux.dev>; Thu, 29 Aug 2024 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933017; cv=none; b=MFvWPgYWfCjcuDJZ2BZ9q88z+sdnne1/YmkJV8CJe28n17Np0745StNMpUDzs8U/nnxEoj/rPKoRJeVzuPBYDoquL85YpmNcrKprbocTNno6jhd3U7bA7dmgeZErWt2I8hlk8tNA+FCgvoxpsabbORgbXpd74uGDKboliqctb3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933017; c=relaxed/simple;
	bh=u8awxGC8APLD2fBPkfXwUnekJ7v92Iejds6q48zmlhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fen69fhOD7Lfx6/43HdjZYMc2LTyk1EJPZNwyMU2YUWc78VRefR+va6oItwwbcHNEzO5M+HEq6HYYKkRt/CRvODjxTE2+lGTZIGRIwveFMWkBDOF922d20Z12UhK+SxxMxvUZHMLg6FC0daLAFp6dnhnSAXZNHy+BUuHyNn6IuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hjRnRAAA; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hjRnRAAA"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a1df0a93eeso33498985a.1
        for <linux-coco@lists.linux.dev>; Thu, 29 Aug 2024 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1724933014; x=1725537814; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8awxGC8APLD2fBPkfXwUnekJ7v92Iejds6q48zmlhU=;
        b=hjRnRAAA7hm1OxOEs/Wf39r3yBM13+HGhvSGdRpTdEvpgmGkeWJoFM5vNvOywoaAMv
         QEFlmlNKdmk6MeBfKoAHFM5EkCMcPZ7dUzESsRT6kRcPGjY7ah0GfWj/o3ATvF/lc5x/
         kNEEBONu1uiVEZVcpSh06Ph+vpLJSTSWYYKCm+BmX5wW3y+DmH8POlnSNA54nmDKOR//
         suqcJSW0+zmj0/jY7raezHl9p/Puj40lkbEb++RqEISi3BqE4XcJY2UiGVLm9pVOOWIO
         svu47IBoFlRRet18N5nS4j7geA/RA8hLjxskVLUYe7B1dqgV/5Psu7sJuzHKFLLXPM86
         1Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933014; x=1725537814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8awxGC8APLD2fBPkfXwUnekJ7v92Iejds6q48zmlhU=;
        b=kXuUkdz/7nJPYcwgfVt2lSoiNPIzbYJamZkCJtxvSuv/vL6ApFCUPBQyLXJ+n3J3AR
         +cUJdPkbj+rdXeRpVWTSJbF6+6e6+eCgFDnzMvVkGHfWMKh9Z6AYv5BIhCWlNkWk2v8b
         TzF7Jh5hW6psA8pw1/cAySSbfjbbm7VUsDeduPvel26Bxs4yxOdEcoFH3PyapYLwcJJR
         EoSkGVjZtcHyKZlEl3Q4XTGZvkKrKHozeSIkHvTGReGjSewMF8rePovHI4ELiSnLEs9l
         R0TQI/yiGbAjoYT/jh0pFr+IYTfRbiSz7tl+8Y8yxDzhPg0zWA2CEL1BepVYxKD1F6cq
         fyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5SCAs8JDyw0gOaX2ly3uTJlqIR11XQ8SbBxhA5b1lb4KVhZX/SjUeDdC1BOPoiscRNkJUTHpMxw/p@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhw8fkNG0BSOM/hv7G6MQfi7k6ejVZrE74NH7FDyAMoVTEKjD2
	Tl6QWDJN9xforqUyIl4ZIyxqKu2495sucMOA3S0vW+zpB+IYcR4uua43p0PTSHs=
X-Google-Smtp-Source: AGHT+IGh1eftOELfePw5LBn8NrYfzH+v7ipL5QEhLmSsHv26fcAASM8yAzTbd5l6W1iebV1DkwTkvg==
X-Received: by 2002:a05:620a:4409:b0:7a1:e41e:4d5c with SMTP id af79cd13be357-7a8042668b8mr337112085a.59.1724933010626;
        Thu, 29 Aug 2024 05:03:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3944esm44767985a.80.2024.08.29.05.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:03:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sjds7-007TEL-WF;
	Thu, 29 Aug 2024 09:03:28 -0300
Date: Thu, 29 Aug 2024 09:03:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
	iommu@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	pratikrajesh.sampat@amd.com, michael.day@amd.com,
	david.kaplan@amd.com, dhaval.giani@amd.com,
	Santosh Shukla <santosh.shukla@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>, Alexander Graf <agraf@suse.de>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 07/21] pci/tdisp: Introduce tsm module
Message-ID: <20240829120327.GT3468552@ziepe.ca>
References: <20240823132137.336874-1-aik@amd.com>
 <20240823132137.336874-8-aik@amd.com>
 <20240827123242.GM3468552@ziepe.ca>
 <6e9e4945-8508-4f48-874e-9150fd2e38f3@amd.com>
 <20240828234240.GR3468552@ziepe.ca>
 <66cfba391a779_31daf294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <20240829000910.GS3468552@ziepe.ca>
 <66cfbec0352ca_47347294af@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66cfbec0352ca_47347294af@dwillia2-xfh.jf.intel.com.notmuch>

On Wed, Aug 28, 2024 at 05:20:16PM -0700, Dan Williams wrote:

> I encourage those folks need to read the actual hardware specs, not just
> the PCI spec. As far as I know there is only one host platform
> implementation that allows IDE establishment and traffic flow for T=0
> cases. So it is not yet trending to be a common thing that the PCI core
> can rely upon.

I think their perspective is this is the only path to do certain
things in PCI land (from a packet on the wire perspective) so they
would expect the platforms to align eventually if the standards go
that way..

Jason
