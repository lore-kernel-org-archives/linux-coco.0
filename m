Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D5A935
	for <linux-coco@lists.linux.dev>; Sat,  1 Mar 2025 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740788904; cv=none; b=G/u2HXHmW5TFkV58yDif/PxYaw3RTP6+1bcCHrt7vm01cFUa5nKWUvsZGqCIylOKlcAA7AT80/qRXIikwf5OgdFKnLFSQDgCjtAR/JRVYHCaqjACf6yBN4yAQfY8YNn/v1pQFqS7LRjqJ4Iz2yI66AmsZ93OSrrgdZoWNpak5BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740788904; c=relaxed/simple;
	bh=etpaj8E6HzSygIZNR+IwBTh7AHHX2A8bGyqGJTitllQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhIAo8FQdbVoL0WpvWA+lHC9V70lAYM0xreAxfSpcp9rQoHSECzVpv3Lc7d8bobFSIbjTT+S5fGSH5UkqHb7Tw2Fy/9AzGzM1RjuwrOxHzC0GYTeC4EnK4pUOVIkFb27gZUmQGq8/oGDXs7hHvue7jIM4fUcqV8/5e0izt7P7bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IHLImALg; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IHLImALg"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd01781b56so30736576d6.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 16:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1740788901; x=1741393701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=etpaj8E6HzSygIZNR+IwBTh7AHHX2A8bGyqGJTitllQ=;
        b=IHLImALg9CLSvuC9MamRaXEfTr2PpLWrD2R/5XNkPlJvqweuW5XBMLKtUesPYRP/85
         6XKC+ksGw7YZAL17Jtq6xtcSDcMYErcrzX1HmycXg6g5giENmLmFXdMBW2WelnnzeHnv
         WQW8lG2RBiswbVV9mcht+mMAU75UbNKDcBj+nelnUkWoc+MHXkhb1gx1lk6ylbi0b+aB
         Y0kWuDUxchuq2BgJu0JnyZytb9hFiEdxsZ80ul8sD09UXNlueQ10OiwlxE2QxJXfHttd
         qNyc7Qla/oMpi0O06DO7MGzkw1wPwIWakCpx9RSk7TYdicxl58bA7KJeGKCtjZl6ZF0+
         2AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740788901; x=1741393701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etpaj8E6HzSygIZNR+IwBTh7AHHX2A8bGyqGJTitllQ=;
        b=sbYLAaOYTiwqut1/jQ+cxvhxeNCc8qpcrH0+2QTT+caQ33I9VkymEKp+Kt4kUfRs9y
         EqhjtgzmhhfLroSft15uciDq58g3Yc//TXYV4JmEVM8o9Zsm/2eg84dnd0tk2bVY4yd5
         7tMeO96Wkbzbbh5hrqXeb/VZq6G41v3WF8/C+GweHyuOXzcM9wa20hSP4yw5vz+Rt6FG
         wGoPBJFEjxE15RTb/3f+n0emw6+VlqrAfI5DXt9Z34Y3BQHpc3V8p9Sons6p/4DYTN51
         k3GRgCClsDax9gbx6yfFzVKoMPiWjU0qoPoB8rluXE3rCn7yA9iATy7xcfDVtRCFPvLw
         yRyw==
X-Forwarded-Encrypted: i=1; AJvYcCW0mV2qUxq27/tCrbx9MnaHog42oqSeNgdwVwwDM8oF9JunpZ0Xg5h5BQ+9AaInMVHG1qfSSv2xCRNq@lists.linux.dev
X-Gm-Message-State: AOJu0YwjT4JGqbcamsTvEb2vjqSpo3XnM3TS/ag69TGRqStu9kGdpRAB
	9Cp10+K9HABzyb804ziyByYrdDPisnCPjPKMOLpC068vu+vRFA1VOUu/HviQX0s=
X-Gm-Gg: ASbGncumEFy9OWdzpdZGrD+y4zF9vvKp1vcADAGqIyv2Ag2c15MUCFp3dLLyo8LPjMQ
	JivudyFm4btlhIQlUOHbYVvwRCvULc+d/JUpHJXPCimx8VJGPk6efaKEHSntE0I4z/UNP4XgKgS
	c95C+amcaLHgIYFgtMGmCSUE+fk/OAPt7i8DS2fgHf8X9xdkXG2BuGlKRKGPxg9SQ2KppzJdah6
	8TETAlLCEa75aEIV0lBx5aItJ5ZwoaGbxAHzzFWus1C3XNDL6f2NUuQy/ekjC/uQn2IYqcuynmS
	DYbmqfvcoPeWQSa3x3cIZSVSV51PUmM+XTYJ/TdfLOid+u4jq/hSFLYD0F96dTPypjjA2n1cBYh
	wQ3ZUzLk8uAvKSKL1ZA==
X-Google-Smtp-Source: AGHT+IGWUW0tauc6sDT2qPhkNDpocp6ePHjchDO/mgzAg7gbE6xKrSwlcBJaiGl9R/g8B01dEdQcag==
X-Received: by 2002:a05:6214:262b:b0:6d8:5642:d9dc with SMTP id 6a1803df08f44-6e8a0c9f135mr80504936d6.11.1740788901200;
        Fri, 28 Feb 2025 16:28:21 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378d9fe15sm307375585a.66.2025.02.28.16.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 16:28:20 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1toAiJ-00000000VMt-2hZA;
	Fri, 28 Feb 2025 20:28:19 -0400
Date: Fri, 28 Feb 2025 20:28:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>, x86@kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev,
	Dionna Glaze <dionnaglaze@google.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [RFC PATCH v2 5/6] tpm: add SNP SVSM vTPM driver
Message-ID: <20250301002819.GO5011@ziepe.ca>
References: <20250228170720.144739-1-sgarzare@redhat.com>
 <20250228170720.144739-6-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228170720.144739-6-sgarzare@redhat.com>

On Fri, Feb 28, 2025 at 06:07:19PM +0100, Stefano Garzarella wrote:
> +/*
> + * tpm_svsm_remove() lives in .exit.text. For drivers registered via
> + * module_platform_driver_probe() this is ok because they cannot get unbound
> + * at runtime. So mark the driver struct with __refdata to prevent modpost
> + * triggering a section mismatch warning.
> + */

??? Is that really true? I didn't know that

I thought you could unbind anything using /sys/../unbind?

Jason
