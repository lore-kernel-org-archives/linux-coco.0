Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE7238D53
	for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753964992; cv=none; b=n9WN4fge9qShDQWk/liHiyV9Kv+SstXxFgk8H9oOUzwhQe0rZ6t2g5817FCJ7UPwnuBP4klNHwDrx6SF/ePhay5fI5e3lD1gnMUE7aXb3FVBKWZR22yXVor5jaHPmjnt1HO5Z9ZvTSeHf2UBRaGzx1fW2hBzzB8ZlJ1sYcocHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753964992; c=relaxed/simple;
	bh=stFuxurLK8Z8AnaZ49l9W8w7aFsmtWO77oIxpAGLTIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1H0mJvCNNf0rPO0Mab/qKM4FAWmV8CITdAHGDwFSyQdGOkx+nNiEzcbWVVkZhT/Va7rM5MPArQeUkiXrNGlhzY+LF+lOwGU59/a9f074SWD2himA5Agv2RvX6Xi74tlmRhpu0KMF6l7giE/A2RVjbVINGBkV9G7PmN9yBVsn9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=W2eSco0I; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W2eSco0I"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7074bad0523so3304086d6.3
        for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753964990; x=1754569790; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r16L0lPAepHRljLoRD2C+qwfP2TiLc2fMDqSQ/mjsSA=;
        b=W2eSco0IBoyrIjfBDcnjSPTMaH+x1lng7XSUqlc9XkC7FU506RBhuCUlfBkV8LLYT4
         lEUgNASQYXRlH7K/qEjO8l/wQrpjpO/oe7uMgufkgamTd9s/A6wjr8aVIL3cd5OqRqs2
         laGwVwKqkNypsc7c09cmZfBmRymzLKBdYx6QpH2rOWhrXzB6+BVzP96erYDnBLi1RwT2
         gwZzVrt+S+kOLTgmGs6VEp604nA4GZbRaVa8P7XOiKg/NQyqF+751NgCVRRn3wrRXsnm
         wtvvFNbYuILO76XbOVWQmPbvIyJDHBHkj2RJEbYID/i1s/uktUPwItZvtrLDbxdBv7NY
         cLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753964990; x=1754569790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r16L0lPAepHRljLoRD2C+qwfP2TiLc2fMDqSQ/mjsSA=;
        b=aLqrYJzQdx+2W+LRpK7c7IjwZs646h8VCrhKOrVlukxCVQlKQffKsPcGZZF6RAQpd6
         P2FD8SSDWFY6LhT+Yy2He+wIe41DRsdTQZ0w6QGeHNmrJitW+zqMX/QXWnhdYjNGj7F7
         SMT0hL9vOzrsHaZIAM3hv7ajIYdvGivJF+41K6AgZFtL9RSb3WAAPz+P3Ug9WzexY3FI
         SUuG9mhsQbqKRhxsV6RAZ5adKQyIyX1omLPhhqON9ew6bOXmvvsDuv+2m/zZX/WYf4uG
         ddAbAFfktzwwbeBopIJ0dy55sdyjREJ8f2zdMwyDGXwSUex9FBTX02q6sCRNVhBTD/Ce
         xzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftyLkX+7KSb0q4xKTIcWPbZu/R+AKKQgow7amur6nfE0xrkI95NTA42GGcS3HBOx6ZqBY8QWz3a/8@lists.linux.dev
X-Gm-Message-State: AOJu0YzoG8gU7lokESkUhasM1GHti3rCCJxw16m/tv+LPq9FPAb5g+fv
	cW7KeGWm0lJ7lenFcKRrEhIFn1MgnpJADwnwZZr9hw5c2i4hWtdoiamK04NqRyXVMhM=
X-Gm-Gg: ASbGnct+pbvGsUrqBRicZYJ3y3gksuIv+vW2X2SiBP1fZPkIpW8E5xQ6+zd8C6YnZwf
	3A9GIomblB9MU1IwuYg+PjjbtyE7HWfX9ZGnkmEmur+z4DfRZmbzrL2kwxmEwOPsqd41p79x5rm
	SItNC5mXEAyB6YPeI0qPlV76vqzRKOaO5wmClq/G8Ni4WqX2wSg9ma8nXmlV/rIp24jnfr4Cbxp
	epdLe93iAMhbiO7rH8cv6BLV/DHhfi6VNM3ynBaDu9wd0SdWfDsGRH0Vht8AU6ssWYEzB+fM2rv
	pj/dirseDIoKtiq0ampm7qCJRHqPrJAeMOqqOd7Pn+MFRGfSHuSD7rXXNWVVZQ8zS/hGzmMOrbh
	pKRBDzpvqHqDZIn2oBdjv4RTbjecEhYJU8yopDg4PHyQiOuuingSWSO5kww9QH4RSdMkiC3LMxV
	+U030=
X-Google-Smtp-Source: AGHT+IGFRiq4QY4lDaxJA1kOgdG4s98/jc148KJ+4RcbhXD0Gv7ljg9jqdQ+tgIuoEfTT/tXWxH4vA==
X-Received: by 2002:a05:6214:248a:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-7076710c664mr94449716d6.24.1753964989913;
        Thu, 31 Jul 2025 05:29:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077c9d98ecsm6607476d6.2.2025.07.31.05.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 05:29:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uhSPs-00000000obJ-3nd7;
	Thu, 31 Jul 2025 09:29:48 -0300
Date: Thu, 31 Jul 2025 09:29:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	aik@amd.com, lukas@wunner.de, Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [RFC PATCH v1 23/38] coco: guest: arm64: Update arm CCA guest
 driver
Message-ID: <20250731122948.GU26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-24-aneesh.kumar@kernel.org>
 <20250730152204.00006f79@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730152204.00006f79@huawei.com>

On Wed, Jul 30, 2025 at 03:22:04PM +0100, Jonathan Cameron wrote:
> > -static void __exit arm_cca_guest_exit(void)
> > -{
> > -	tsm_report_unregister(&arm_cca_tsm_ops);
> > +	return ret;
> 
> 	return devm_add_action_or_reset()
> 
> Mind you, Jason probably won't like this ;)

devm in a module __exit function? How ?

Jason
