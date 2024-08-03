Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D907BF9CC
	for <linux-coco@lists.linux.dev>; Sat,  3 Aug 2024 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722650090; cv=none; b=VEgKki9P2NQwar7osgeMUxQDwg71pZN8ivmCg0br1rk+znUY4kIQoY1texaIhKiWR/DYhCc0FhJbYyOEbglcTT62Qgz8z48etGhcI10qkAyEJyBN6oEynP0Vt29xpK/TO/mvSoucV20RhN8oyHIz/wfP/L8CYInmSGBfLT7Rk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722650090; c=relaxed/simple;
	bh=E7e79aA32W4JF+fEYCvSFXJ02nGzWhCbHGNj1P6FgH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nACrHntf4fVBFlzFR3I6bH8SvD8gKNn98wxZlGChEdxJw3xeHUgOiPRvixjNL7N8ojgfs+GyIQDi7TlXmgu3pKuKPQ9ldXUlQRdgULDm7tuF8nubGhYy8JWpw+CkhmTpIFL8g72wE416DhC0NpweXicztSgQ2jJMX385TGA6IIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jFY0VJRI; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jFY0VJRI"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso68365a12.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Aug 2024 18:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722650087; x=1723254887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7e79aA32W4JF+fEYCvSFXJ02nGzWhCbHGNj1P6FgH0=;
        b=jFY0VJRIy1wb1lEeOvPEe7Vp5KEXZFJ9NoocuM1+r6Sh8X6fwH2sDQcFsg8eTU0Qwy
         KVyovOhYGh1sHGZK1FHuVMp9hChhMjgtL2nHLHTdJAbjmrJScIISZ4G1qj+3wn4x0A6q
         c7mAiedQyY0meXLAc028YyOvDyx4fRtrK+b9D1NL1ovw23ejiN2h+49INZtgMJ0Y94/6
         pmKEYY+mez6xacyU4S1Ql2oYDmqVajkhslM5cpn0IEq2gGgH3jujsGdRAh6L2ISqEx5H
         Zv8T08vzSsx2BXKyq1HBtPmN5g1Yhigl/UVfaxNCYhIXHCfWQ+3h16DwoYpyCh34MM1I
         6DeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722650087; x=1723254887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7e79aA32W4JF+fEYCvSFXJ02nGzWhCbHGNj1P6FgH0=;
        b=xJvjTcI1qvNcvBMTEsuv0SBb6tOxvzAMEPLhDvHBeIaSLl9hkwpugv8HlpsSCCpFQb
         EbWX9rUsGBHPxUlmxBDgXYJIeYXyonBMjxmkRl5a4+eKLaG8K/yDKjAu0JM6AxqUcrXg
         ACm+3gDe+LBc4Xcvg+7IkDI/0OsHYdhBWy2nV/IcpktzwVpOB1nkYYhchGFR7n8hE9sn
         7+xQctPk84uL+6aU2bGzu4TzEf2Qeqb6vd3JROUoB/aFetxM3VWm/wcO3a/OdnSn2Lvm
         lhGzaIE0bobgIXPNkiBdqbUI899kVfQFbNo+IQc86amjJue+f870TyyxVXeQfOj6l6ll
         eCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu/mj2HZ9UWFU/nJM9JtM4AeCKfUVhVVnfwX6lPsCBnHa5fB8zJwCXiMh/xf2JHBEGtF/GmMQ00VtGe48ZX7/xmFm7tzJH3R5btg==
X-Gm-Message-State: AOJu0Ywc8PJcZ8JpXLQgdgsmoWxTRuwE6TuL/jGYXli69GoDT77e8AmG
	pnAJuVdCxw2/EzO7D/AhXdP98CHSBEvdZOB8lrR9aVoKHeQyVIG5vF+yMiMJPolVRaVhfTMZDqb
	1jYlNxgpeZ2BdkwBj1KQKub9LDboQjb8PHb7K
X-Google-Smtp-Source: AGHT+IHm0FxIRsuQlbnDE0iVMEDHkfMJGxjwnC8NN1gYqjWJG6njHgmnRFl1QISJVDuWb5Gbwnwoso2D7RZ01s+JSB8=
X-Received: by 2002:a05:6402:34d4:b0:58b:93:b624 with SMTP id
 4fb4d7f45d1cf-5b9c7ae74d7mr33021a12.1.1722650086768; Fri, 02 Aug 2024
 18:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
In-Reply-To: <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 2 Aug 2024 18:54:32 -0700
Message-ID: <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, 
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
	Claudio Siqueira de Carvalho <cclaudio@ibm.com>, =?UTF-8?B?UsO2ZGVsLCBKw7ZyZw==?= <jroedel@suse.com>, 
	"Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, 
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, "Perez, Ronald" <ronald.perez@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

More questions / comments

1.1 "Get TPM AK Cert (signed by EK)". This is something I thought for
a long time too. That's not what the EK does. The EK does not sign
anything. It's used for proving ownership of both EK and AK for
ActivateCredential to get an AKcert from a trusted CA.
What is your intended communication channel between SVSM and a CA for
this credential activation?

2.2.2 item 6, migration needs to ensure that the vTPM state is not
duplicated, which is a possible host attack by spinning up two targets
and directing migration to both. This needs to be explicitly required
for TPM security.
2.2.3 item 8 I don't think the community has fully agreed that MMIO
should be the command pathway for SVSM-based vTPM due to performance
problems. This appears to disallow an SVSM service call implementation
as an enlightenment path.
2.4 the alternate entrypoint TD_PARAM is undocumented. Please add a
footnote that this will be in a future revision to the TDX module
reference.
item 2.1 The launch parameter (TD_HOB) is currently measured to MRTD,
so how is this data communicated to SVSM if it's meant to be measured
to RTMR[0] (and be a useful measurement, presumably because it wasn't
measured to MRTD?)

2.5.2 "TPM CRB interface attack" and "TPM command attack" could use
citations for what you mean.

On Fri, Aug 2, 2024 at 8:40=E2=80=AFAM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Thu, 2024-08-01 at 22:38 +0000, Yao, Jiewen wrote:
> > Hi
> > As follow up, we have drafted the vTPM document and put to
> > https://github.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp-vtp=
m/Documentation/TD%20Partitioning%20based%20virtual%20TPM%20Design%20Guide%=
20Rev%200.5.1.pdf
> > .
>
> Just a note for the vTPM reference implementation which, I think,
> applies to both you and the current SVSM-vTPM: the reference TPM
> implementation has moved to
>
> https://github.com/TrustedComputingGroup/TPM
>
> And the one you list (https://github.com/microsoft/ms-tpm-20-ref) is
> now a stale copy that isn't being kept up to date.
>
> Regards,
>
> James
>
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
