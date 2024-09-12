Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236519CC25
	for <linux-coco@lists.linux.dev>; Thu, 12 Sep 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133105; cv=none; b=nqw664x7aiW4trPagjF+yk5nLKnsXgmV/Nun/AywrG1rjRQh346VL108g3ZCovcshrgiO1dxg6Wlp3laolHkwEWIhXEZZjCkjd8Qfo02KA26sl6d4m7LGvyZIBiWM4Mg0sUl2lB0MuahycxjRB8mUDmuN+zocp38BGSB+6R5GS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133105; c=relaxed/simple;
	bh=VEkaN2FTgKRjhRt2edSnxa3PFRmoc+uhzmCMz3xbYNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcpWhVdE5pJOgtqZSN3w4XOKabMb8KWqy68wBYEPYz/nh9ec7bqf6nSmMgZswZ/pAQLgbE2+TD/5nFqNbyPD7s1Vt7XleY476PStQA1RiDoo4uU6FBki2KgGk3X1aUEYsLqDSjsJXXiCiiGLVglAo4WrvRet2fld4SQ6I3EyjSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+n0JF+i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+n0JF+i"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so589224f8f.1
        for <linux-coco@lists.linux.dev>; Thu, 12 Sep 2024 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726133100; x=1726737900; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V436iQY1F+axNsCXYOuUL7LDutALszGT+Yz3FD3PgZU=;
        b=C+n0JF+iIRrvH1AX88dJM5sdnDX24QcFlmjhX/QKxfHkna5u7MY+uV89Bzb//HPRDT
         GV2eyNXFzPNPHb9gIjkvMlA4QpEPNkZ3OGTsD76Il/JJSXql79kWHuYbi73G0ihwO4Vk
         rRYlPZEVXMh2YHIidXdUtWmxqkHgrtCfdaNUsuwPLVZNzt53sdnMDeSIDC15JLDbk2wS
         KAX3dB6WYxXLR1tiPLivGj+mDQRsGYYdt3wFJv9KkGUaoJGbgH+rvq9fw4cCFxzjKe5Y
         ZeBlt8Dsip+au0W0pQ4HMSvA/9iDGan3WzUw0DA6+H9eEGZoQ3dOsJv94GGAuBqFYAA1
         K4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133100; x=1726737900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V436iQY1F+axNsCXYOuUL7LDutALszGT+Yz3FD3PgZU=;
        b=XPVxSnQSzGpQp/0xKCOmQhFQFPOg5X9T7h8y1liAg6Es1faMXjhDtZo6syKd57yZBX
         y36+e+1jXMKJJ57cpsBu41Y2L2kM6FhFBRrAu2JxcUlEnPcnpdm33X7fpwzpt5L/wBiQ
         +78t5TmgJ9WtCMvYHzA9eJYO/J6tz2yDABYDaGdAUHMJGOecHTFYNfCQmcuyY9jj7G/h
         9URFIeIbwNCNevtdsFwPYJy4QXoSXWevKa7QBqYLFvNBGDTwComl5gzdNRGlPqImcnjO
         yf2Bcc+TUvtlSbYkH7pi9NLJI2Fk8Ko3SJw5uTVaqjL5TsS8RpVv3YyFqV5UALjFvxvJ
         BrrA==
X-Forwarded-Encrypted: i=1; AJvYcCWxTNTvokWJwMrxLx981DxaT+68WtzajrbDStNaSVXD08MEaQqDo3THkJ2jfVnkysbZ4ZwLSDU1of0O@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Up+Wa4cX3fGHDoBnSe+zWCD6sAcEk4M8i/E4EWpHTEORxKDE
	dTLG5Ng4sLgC0W5ob8JkMHxHcYPxupP0B5/8o8eio2TFZa9LTuAPkqGerWhRBkA=
X-Google-Smtp-Source: AGHT+IESQpf/ctf5OSUT7sMoKWqy8Vweyv1KSdUoUfllVs0RqCkznDBDoCjvEDzLS1ARP7gn/dWpVg==
X-Received: by 2002:a5d:4e10:0:b0:374:cea0:7d3d with SMTP id ffacd0b85a97d-378c2d622c0mr1153745f8f.53.1726133099561;
        Thu, 12 Sep 2024 02:24:59 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb3aa820esm142557315e9.12.2024.09.12.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:24:58 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:25:19 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Xing, Cedric" <cedric.xing@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Lukas Wunner <lukas@wunner.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Qinkun Bao <qinkun@google.com>,
	Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	suzuki.poulose@arm.com, sami.mujawar@arm.com
Subject: Re: [PATCH RFC 0/3] tsm: Unified Measurement Register ABI for TVMs
Message-ID: <20240912092519.GA4892@myrica>
References: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
 <20240910170959.GA213064@myrica>
 <f6b0a1d2-c730-4b20-a8f3-afd9a7cf822a@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6b0a1d2-c730-4b20-a8f3-afd9a7cf822a@intel.com>

On Tue, Sep 10, 2024 at 11:01:59PM -0500, Xing, Cedric wrote:
> On 9/10/2024 12:09 PM, Jean-Philippe Brucker wrote:
> > Hi Cedric,
> > 
> > On Sat, Sep 07, 2024 at 11:56:18PM -0500, Cedric Xing wrote:
> > > Patch 2 introduces event log support for RTMRs, addressing the fact that the
> > > standalone values of RTMRs, which represent the cumulative digests of
> > > sequential events, are not fully informative on their own.
> > 
> > Would each event_log include the events that firmware wrote before Linux?
> No. The log format proposed here is textual and incompatible with TCG2 log
> format.
> 
> The proposed log format is based on the CoCo event log -
> https://github.com/confidential-containers/guest-components/issues/495.
> 
> > I'm wondering how this coexists with /sys/firmware/acpi/tables/data/CCEL.
> The proposed log will take over after booting to Linux. The `SYNC` line in
> the log captures the RTMR value before it, which can be used to verify CCEL
> left off by the virtual firmware.
> 
> > Maybe something like: CCEL only contains pre-Linux events. The TSM driver
> > parses CCEL (using a format specific to the arch, for example TCG2),
> > separates the events by MR and produces event_log files in
> > /sys/kernel/tsm/, possibly in a different format like CEL-TLV. Is that
> > what you envision for TDX?
> > 
> CCEL will be pre-Linux only. Given the proposed format is incompatible with
> TCG2 format, I don't think those 2 logs will be merged. But if we get any
> success in this new log format, we may influence the UEFI/OVMF community to
> adopt this new format in future.
> 
> We have evaluated both TCG2 and CEL formats but arrived in this new format
> because we'd like to support ALL applications. And the only sane way I could
> figure out is to separate the log into 2 layers - an application specific
> semantics layer (a contract between the application and the verifier), and
> an application agnostic storage layer (implemented by the kernel). The
> common problem of TCG2 and CEL is that the event/content tag/type dictates
> which part of the event data/content to hash, meaning the kernel must
> understand an event record before hashing it. And that has prevented an
> application agnostic storage design.
> 
> Anyway, this new log can be encapsulated in both CEL-JSON (like what systemd
> is doing today) and TCG2 (using the EV_ACTION event type) formats. Please
> see the CoCo issue (link given above) for more details.

Thank you for the explanation. In our case I'm guessing we'd then have a
userspace library to:

1. read the CCEL (from multiple FW interfaces unfortunately: ACPI,
   devicetree, maybe EFI)
2. read each event_log from your proposed interface
3. collate everything into a single log, using eg. CEL-CBOR, and send it
   to the verifier.

There may be some value in having the kernel TSM module do all of this,
but userspace seems like the right place for this sort of complexity,
especially the log format conversion.

> 
> > I ask because I've been looking into this interface for Arm CCA, and
> > having unified event logs available somewhere in /sys/kernel/confg/tsm
> > would be very convenient for users (avoids having to parse and convert
> > different /sys/firmware interfaces along with Linux event logs). I would
> > have put a single event_log in /sys/kernel/config/tsm/report/ but
> > splitting it by MR should work too.
> > 
> We have considered one global log vs. per-MR logs. In fact, a global log is
> equivalent to the concatenation of all per-MR logs. We've adopted the per-MR
> approach to keep the log optional - i.e., an RTMR can be extended directly
> (by writing to its `digest` attribute) without a log.
> 
> With regard to the location of the MR tree, we picked sysfs because the MRs
> (and associated logs) are global and fit more into the semantics of sysfs
> than configfs. Dan W. and I are also considering moving both report/ and
> measurement/ trees into securityfs. It'll be highly appreciated if you (and
> Alex, and everyone) can share your insights.

I agree with Dan about keeping report/ in configfs. It would be nice to
have both in the same place, but no strong opinion.

> 
> > As Alex I believe we need more similarity between the interfaces of static
> > and runtime measurements, because verifiers may benefit from an event log
> > of static measurements. For example Arm could have a configuration like
> > this:
> > 
> >    struct tsm_measurement_register arm_cca_mrs[] = {
> > 	{ MR_(rim) | TSM_MR_F_R | TSM_MR_F_LOG, HA },
> >    	{ MR_(rem0) | TSM_MR_F_R | TSM_MR_F_X | TSM_MR_F_LOG, HA },
> >    	...
> >    	{ MR_(rem3) | TSM_MR_F_R | TSM_MR_F_X | TSM_MR_F_LOG, HA },
> >    };
> > 
> > Here rim is a static measurement of the initial VM state, impossible to
> > extend but could have an event log. rem0-3 are runtime measurements,
> > extensible by firmware and then Linux. None of the digests can be written
> > directly, only extended and read with calls to the upper layer. The tree
> > would be:
> > 
> >    /sys/kernel/config/tsm/
> >    ├── rim
> >    │   ├── digest
> >    │   ├── event_log
> >    │   └── hash_algo
> >    ├── rem0
> >    │   ├── digest
> >    │   ├── append_event
> >    │   ├── event_log
> >    │   └── hash_algo
> >    ...
> >    ├── rem3
> >    │   ├── digest
> >    │   ├── append_event
> >    │   ├── event_log
> >    │   └── hash_algo
> >    └── report/$name
> >        ├── inblob
> >        └── outblob
> > 
> I see. The desired/missing feature here I think is to allow a CC guest
> driver to supply an "initial log".

Yes, although that would only be necessary if this new interface is able
to include the pre-Linux events in the log, otherwise the event_log for
static measurements here wouldn't contain anything.

If firmware events aren't included in this new interface, then presenting
static measurements doesn't seem useful for Arm CCA, since by definition
they can't be extended. In my example I added 'digest' files only because
our interface allows to read them directly from the upper layer, but the
normal way to obtain digests is through /sys/kernel/config/tsm/report/,
where outblob contains all digests, signed by the platform. So for CCA the
tree would look more like:

    /sys/kernel/config/tsm/
    ├── rem0
    │   ├── append_event
    │   ├── event_log
    │   └── hash_algo
    ...
    ├── rem3
    │   ├── append_event
    │   ├── event_log
    │   └── hash_algo
    └── report/$name
        ├── inblob
        └── outblob

But I understand other archs could have a use for presenting the static
measurements here, in which case presenting them in their own dir with a
fine-grained selection of files like you suggest below would make sense.

Thanks,
Jean

> I can define a LOG bit, which if set,
> will make the MR its own dir with `hash_algo` and `event_log`. And if X is
> also set, then `append_event` will appear as well. Does this sound like what
> Alex and you are looking for?
> 
> -Cedric
